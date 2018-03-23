function wstar = GetWStar(x,t,m)
A = zeros(m+1);
for i=0:m
    for j=0:m
        A(i+1,j+1) = sum(x.^(i+j));
    end
end

T = zeros(m+1,1);
for i=0:m
    T(i+1) = (x.^i)*t';
end

wstar = A\T;
