function plot_orbit(x,y,z)
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
end
