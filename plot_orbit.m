function plot_orbit(x,y,z)
%PLOT_ORBIT plots the orbit of the spacecraft in three dimensions
%   plots in whatever units are passed in

scale = 50;
[X,Y,Z] = sphere(10);
XX = X./scale;
YY = Y./scale;
ZZ = Z./scale;

cla
surf(XX,YY,ZZ)
axis equal
hold on
plot3(x,y,z)
hold off
end
