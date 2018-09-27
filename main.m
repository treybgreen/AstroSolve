clear,clc

r0 = [5;0.707;.5];
v0 = [-0.5;0.1;-0.1];
mu = 1;

[p,a,e,i,omega,Omega,nu0] = classical_orbital_elements(r0,v0,mu);

fprintf('Semi-Latus Rectum (p):\t\t%f\n',p);
fprintf('Semi-Major Axis (a):\t\t%f\n',a);
fprintf('Eccentricity (e):\t\t%f\n',e);
fprintf('Inclination Angle (i):\t\t%f\n',i);
fprintf('Argument of Periapsis (Omega):\t%f\n',omega);
fprintf('Ascending Node (omega):\t\t%f\n',Omega);
fprintf('True Anomoly Angle (nu_0):\t%f\n',nu0);

[x,y,z] = orbital_elem2geo_eq(p,e,i,omega,Omega);

figure(1)
plot_orbit(x,y,z);

