function [p,mage,i,O,o,nu_0] = plot_orbit(r,v)

mu = 1;

magr = sqrt(sum(r.^2));
magv = sqrt(sum(v.^2));

h = cross(r,v);
magh = sqrt(sum(h.^2));

n = cross([0,0,1],h);
magn = sqrt(sum(n.^2));

p = magh^2/mu;

e = ((magv^2/mu - 1/magr).*r - dot(r,v).*v);
mage = sqrt(sum(e.^2));

i = acosd(h(3)/magh);

O = acosd(n(2)/magn);

o = dot(n,e)/(magn*mage);

nu_0 = acosd(dot(e,r)/(mage*magr));

%display classical orbital elements
fprintf('p = %.6f\n', p);
fprintf('e = %.6f\n', mage);
fprintf('i = %.6f\n', i);
fprintf('Omega = %.6f\n', O);
fprintf('omega = %.6f\n', o);
fprintf('nu_0 = %.6f', nu_0);

nu = 0:pi/64:2*pi; %create nu vector
r = p./(1+mage*cos(nu+(Omega*180/pi))); % create r vector
phi = i*pi/180; % phi is zero since the orbit is equatorial
X = zeros(1,length(nu)); %set up to convert to cartesian coordinates
Y = zeros(1,length(nu));
Z = zeros(1,length(nu));

%convert to cartesian
for i=1:length(nu)
    if(nu(i) > pi/2 && nu(i) < 3*pi/2)
        phi(i) = 180-i;
    else
        phi(i) = i;
    end
    [X(i),Y(i),Z(i)] = sph2cart(nu(i), phi(i), r(i));
end

[x,y,z] = sphere;
a = .01;
s = surf(x*a,y*a,z*a); % plot the earth
axis equal
hold on
plot3(X,Y,Z) % plot the orbit
grid on
hold off