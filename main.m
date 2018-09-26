clear,clc

r0 = [-0.707;0.707;0];
v0 = [0;0.5;0];
mu = 1;

[p,a,e,i,omega,Omega,nu0] = classical_orbital_elements(r0,v0,mu);

fprintf("Semi-Latus Rectum (p):\t%f\n",p);
fprintf("Semi-Major Axis:\t\t%f\n",a);
fprintf("Eccentricity:\t\t\t%f\n",e);
fprintf("Inclination Angle:\t\t%f\n",i);
fprintf("Arguement of Periapsis:\t%f\n",omega);
fprintf("Ascending Node:\t\t\t%f\n",Omega);
fprintf("True Anomoly Angle:\t\t%f\n",nu0);

A = [1,0,0;0,cosd(180),sind(180);0,-sind(180),cosd(180)];

nu = (0:0.001:2*pi)';
r = p./(1+e*cos(nu));
phi = zeros(length(nu),1);
x = zeros(length(nu),1);
y = zeros(length(nu),1);
z = zeros(length(nu),1);

for i=1:length(nu)
    [x(i),y(i),z(i)] = sph2cart(nu(i),phi(i),r(i));
end

figure(1)
plot_orbit(x,y,z);

