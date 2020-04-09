function abs_data = my_abs(input_data)
%Function my_abs
%   Calculate and return the absolute values of a matrix
%   Usage:
%           output_data = my_abs(input_data)
%
%   Any comments immediately before or after the function declaration will
%   be output in the help documentation.  Available by typing either:
%           
%           help my_abs
%           doc my_abs
%
%   This function will calculate the absolute values of a set of data by
%   calculating the square root of the square of an element.
%   Note: the square root of a is the same as saying a to the power of a
%   half i.e.
%       square root of a = a^0.5
%
%   Note: adding the '.' character instructs MATLAB to perform an
%   element-wise operation i.e. perform the operation on each of the
%   elements individually
%       square root of all elements in matrix a = a.^0.5
%

    % Take the input data variable call 'input_data' and square each
    % element.  Store the result in a new variable called 'squared_data'
    squared_data = input_data.^2;
    
    % Now take the squared data, calculate the square root of each
    % element and save the result into our output variable called
    % 'abs_data'
    square_root_squared_data = squared_data.^0.5;
    
    % At the end of the function only the value of the output variable, 
    % defined at the start of the function, is returned
    abs_data = square_root_squared_data;

end