function a = issandwiched(b)
%ISSANDWICHED Checks if values in a vector are sandwiched between same
%
% a = issandwiched(b)
%
% Returns true for values in a vector that are sandwiched between two of
% the same value.
%
% Note: NaN always returns false, even if sandwiched between two other NaNs
%
% Input variables:
%
%   b:  vector of numeric values
%
% Output variables:
%
%   a:  logical vector of same length as b, true if value in b is
%       sandwiched between two values equal to itself 

% Copyright 2005 Kelly Kearney

if ~isvector(b)
    error('Input must be a vector');
end

sz = size(b);
if sz(1) ~= 1
    b = b';
end

isLast = diff(b) ~= 0;
isLast = [isLast 1];

isFirst = (fliplr(diff(fliplr(b)))) ~= 0;
isFirst = [1 isFirst];

a = ~(isFirst | isLast);

if sz(1) ~= 1
    a = a';
end