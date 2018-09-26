function [transform] = transform_matrix(degrees,matrix_num)
%TRANSFORM_MATRIX Returns a transformation matrix
%   Returns a 1, 2, or 3 transformation matrix with cos and sin values
%   filled in with degrees.

if matrix_num == 1 % 1 Transformation
    transform = [1 0 0
        0 cosd(degrees) sind(degrees)
        0 -sind(degrees) cosd(degrees)];
    return
elseif matrix_num == 2 % 2 Transformation
    transform = [cosd(degrees) 0 -sind(degrees)
        0 1 0
        sind(degrees) 0 cosd(degrees)];
    return
elseif matrix_num == 3 % 3 Transformation
    transform = [cosd(degrees) sind(degrees) 0
        -sind(degrees) cosd(degrees) 0
        0 0 1];
    return
else % Error
    error('Not a valid transformation matrix number')
end
end

