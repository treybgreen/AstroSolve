function [p,a,e,i,omega,Omega,nu] = classical_orbital_elements(r,v,mu)
%CLASSICAL_ORBITAL_ELEMENTS Calculates the classical orbital elements given
%radius, velocity, and mu
%   Returns the semi-latus rectum (p), semi-major axis (a), eccentricity
%   (e), inclination angle (i), argument of periapsis (omega), ascending
%   node (Omega), and the true anomoly angle (nu)

v = format_vector(v);
r = format_vector(r);

r_n = norm(r);
v_n = norm(v);

Ihat = [1;0;0];
% Jhat = [0;1;0];
Khat = [0;0;1];

Hm = cross(r,v);
Hm_n = norm(Hm);

p = Hm_n^2 / mu;
a = mu/((2*mu/r_n)-v_n^2);

e_vector = (v_n^2/mu - 1/r_n).*r - dot(r,v).*v/mu;
% e_pn = sqrt(1-(p/a));
e = norm(e_vector);

n = cross(Khat,Hm);
n_n = norm(n);

i = acosd(dot(Khat,Hm)/Hm_n);
Omega = acosd(dot(Ihat,n)/n_n);
omega = acosd(dot(n,e_vector)/(n_n*e));

nu = acosd(dot(e_vector,r)/(e*r_n));

end

function vector = format_vector(vector)
%FORMAT_VECTOR formats the vector into a column vector and asserts 3
%elements
[a,b] = size(vector);
if a == 3 && b == 1
    return
elseif vector == 1 && b == 3
    vector = vector';
    return
else
    error('Not a valid vector')
end
end
