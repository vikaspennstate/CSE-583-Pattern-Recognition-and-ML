function wstar = GetWStar(x,t,m)
% x = data points
A = ones(m+1); % m is the degree means x to power max
for i=0:m 
    for j=0:m
        A(i+1,j+1) = sum(x.^(i+j));
    end
end
T = ones(m+1,1);
for i=0:m
    T(i+1) = (x.^i)*t';   % t is the observed data
end

wstar = A\T; % take A inverse and multiple with T
