function showObservation(ax,image,dx,dy,obs)
% showObservation - Show the observation in the StatSTEM interface
%
%   syntax: showObservation(ax,image,dx,dy)
%       ax    - handle to axes
%       image - the image
%       dx    - pixel size in x-direction
%       dy    - pixel size in y-direction (if not specific dy=dx)
%       obs   - the image in electron counts (optional)
%

%--------------------------------------------------------------------------
% This file is part of StatSTEM
%
% Copyright: 2016, EMAT, University of Antwerp
% License: Open Source under GPLv3
% Contact: sandra.vanaert@uantwerpen.be
%--------------------------------------------------------------------------

axes(ax)
set(ax,'units','normalized','Position',[0.01 0.01 0.94 0.94]);
x_axis = (1:size(image,2))*dx;
if nargin<5
    obs = image;
end
if nargin<4
    dy=dx;
end
y_axis = (1:size(image,1))*dy;

% Show observation
imagesc(x_axis,y_axis,image,'Tag','Image');axis equal off
colormap(ax,'gray')

xlabel(ax,'')
ylabel(ax,'')
% Restore userdata
set(ax,'Userdata',[])
% axis('manual')
axis([x_axis(1) x_axis(end) y_axis(1) y_axis(end)])
usr = {'Limits',[x_axis(1) x_axis(end) y_axis(1) y_axis(end)]};
set(ax,'Userdata',usr)

% Colormap limits
if nargin==5
    caxis([min(min(obs)),max(max(obs))]);
else
    caxis([min(min(image)),max(max(image))]);
end
    