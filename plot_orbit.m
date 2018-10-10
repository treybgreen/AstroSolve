function plot_orbit(x,y,z)
%PLOT_ORBIT plots the orbit of the spacecraft in three dimensions
%   plots in whatever units are passed in

% Plot a sphere to represent Earth
r_E = 6378.1; %km
scale = 1/r_E;
[X,Y,Z] = sphere(50);
XX = X./scale;
YY = Y./scale;
ZZ = Z./scale;

a = linspace(min(x),max(x),5);
b = linspace(min(y),max(y),5);
c = zeros(length(a));

cla
surf(XX,YY,ZZ,'FaceColor',[0,0,1]) % Plot Earth
axis equal
xlabel('I')
ylabel('J')
zlabel('K')
hold on
plot3(x,y,z,'LineWidth',2,'Color','m')
grid on
mesh(a,b,c,'FaceAlpha',0,'EdgeColor',[0,0,0]) % plot equatorial plane
hold off
end
