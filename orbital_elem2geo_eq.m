function [x,y,z] = orbital_elem2geo_eq(p,e,i,omega,Omega)
%ORBITAL_ELEM2GEO_EQ Transforms Perifocal nu,r coordinates to 3D Geocentric
%Equatorial coordinates
%   Uses semi-latus rectum (p), eccentricity (e), inclination angle (i), 
%   argument of periapsis (omega), and the ascending node (Omega) to
%   transform the coordinates between systems. Uses the transform_matrix
%   function to return matrices.
if e<1 && e>=0
    nu = (0:0.001:2*pi)';
elseif e>=1
    nu = (-1*pi/2:.01:pi/2)';
end

r = p./(1+e*cos(nu));
phi = zeros(length(nu),1);

[xp,yp,zp] = sph2cart(nu,phi,r); 
transform = [1,0,0;0,1,0;0,0,1];
if ~isnan(omega)
    transform = transform * transform_matrix(omega,3);
end
if ~isnan(i)
    transform = transform * transform_matrix(i,1);
end
if ~isnan(Omega)
    transform = transform * transform_matrix(Omega,3);
end

x = zeros(length(xp),1);
y = zeros(length(xp),1);
z = zeros(length(xp),1);
for len = 1:length(xp)
    trans = transform' * [xp(len);yp(len);zp(len)];
    x(len) = trans(1);
    y(len) = trans(2);
    z(len) = trans(3);
end
return
end

