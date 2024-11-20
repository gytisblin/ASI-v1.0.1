% function [anglebtw] = btwazel(azeld1,azeld2)
% 
% azel1=azeld1*pi/180;
% azel2=azeld2*pi/180;
% [xyz1(1) xyz1(2) xyz1(3)] = sph2cart(azel1(1),azel1(2),1);
% [xyz2(1) xyz2(2) xyz2(3)] = sph2cart(azel2(1),azel2(2),1);
% % xyz1
% % xyz2
% anglebtw = acosd(dot(xyz1,xyz2) / (norm(xyz1)*norm(xyz2)));
% end

azeld1=[20,20]

azel1=azeld1*pi/180
[xyz1(1) xyz1(2) xyz1(3)] = sph2cart(azel1(1),azel1(2),1);
a=norm(xyz1)