clear,clc

r0 = [5;0.707;.5];
v0 = [-0.5;0.1;-0.1];
mu = 1;

[p,a,e,i,omega,Omega,nu0] = classical_orbital_elements(r0,v0,mu);

fprintf("Semi-Latus Rectum (p):\t%f\n",p);
fprintf("Semi-Major Axis:\t\t%f\n",a);
fprintf("Eccentricity:\t\t\t%f\n",e);
fprintf("Inclination Angle:\t\t%f\n",i);
fprintf("Arguement of Periapsis:\t%f\n",omega);
fprintf("Ascending Node:\t\t\t%f\n",Omega);
fprintf("True Anomoly Angle:\t\t%f\n",nu0);

[x,y,z] = orbital_elem2geo_eq(p,e,i,omega,Omega);

figure(1)
plot_orbit(x,y,z);

