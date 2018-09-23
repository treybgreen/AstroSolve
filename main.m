clear,clc

r0 = [-0.707;0.707;0];
v0 = [0;0.5;0];
mu = 1;

Ihat = [1;0;0];
Jhat = [0;1;0];
Khat = [0;0;1];

r0_n = norm(r0);
v0_n = norm(v0);

Hm = cross(r0,v0);
Hm_n = norm(Hm);

p = Hm_n^2 / mu;
a = mu/((2*mu/r0_n)-v0_n^2);

e = (v0_n^2/mu - 1/r0_n).*r0 - dot(r0,v0).*v0/mu;
e_pn = sqrt(1-(p/a));
e_n = norm(e);

n = cross(Khat,Hm);
n_n = norm(n);

i = acosd(dot(Khat,Hm)/Hm_n);
omega = acosd(dot(n,e)/n_n*e_n);
Omega = acosd(dot(Ihat,n)/n_n);

nu_0 = acosd(dot(e,r0)/e_n*r0_n);

fprintf("Semi-Major Axis:\t\t%f\n",a);
fprintf("Eccentricity:\t\t\t%f\n",e_n);
fprintf("Inclination Angle:\t\t%f\n",i);
fprintf("Arguement of periapsis:\t%f\n",omega);
fprintf("Ascending node:\t\t\t%f\n",Omega);
fprintf("True anomoly angly:\t\t%f\n",nu_0);

A = [1,0,0;0,cosd(180),sind(180);0,-sind(180),cosd(180)];

nu = (0:0.001:2*pi)';
r = p./(1+e_n*cos(nu));
phi = zeros(length(nu),1);
x = zeros(length(nu),1);
y = zeros(length(nu),1);
z = zeros(length(nu),1);

for i=1:length(nu)
    [x(i),y(i),z(i)] = sph2cart(nu(i),phi(i),r(i));
end

scale = 50;
[X,Y,Z] = sphere(10);
XX = X./scale;
YY = Y./scale;
ZZ = Z./scale;

figure(1)
cla
surf(XX,YY,ZZ)
axis equal
hold on
plot3(x,y,z)
hold off