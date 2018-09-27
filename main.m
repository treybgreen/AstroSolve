clear,clc

r0 = [13500;8200;1200];
v0 = [3.8;5.15;7];
mu = 398601.2;

[p,a,e,i,omega,Omega,nu0] = classical_orbital_elements(r0,v0,mu);

fprintf('Semi-Latus Rectum (p):\t\t%f km\n',p);
fprintf('Semi-Major Axis (a):\t\t%f km\n',a);
fprintf('Eccentricity (e):\t\t%f\n',e);
fprintf('Inclination Angle (i):\t\t%f degrees\n',i);
fprintf('Ascending Node (Omega):\t\t%f degrees\n',Omega);
fprintf('Argument of Periapsis (omega):\t%f degrees\n',omega);
fprintf('True Anomoly Angle (nu_0):\t%f degrees\n',nu0);

[x,y,z] = orbital_elem2geo_eq(p,e,i,omega,Omega);

figure(1)
plot_orbit(x,y,z)

