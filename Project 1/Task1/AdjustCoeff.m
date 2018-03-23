function [ adjust ] = AdjustCoeff(x, w)
m = length(w)-1;
for i = 1:length(x)
    xrep = ones(size(w)) * x(i);
    powers = (0:m)';
    a = (xrep .^ powers)';
    adjust(i) =  a * w;
end
