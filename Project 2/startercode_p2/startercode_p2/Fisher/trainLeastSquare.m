function wstar = trainLeastSquare(x,y,classes)

mat = zeros(length(y),classes);
for i=1:length(y)
    if int32(y(i)) == 1
        mat(i,1) = 1;   
    elseif int32(y(i)) == 2
        mat(i,2) = 1;
    else
        mat(i,3) = 1;
    end
end

D = length(x(1)) + 1;
K = length(mat(1));

mat1 = zeros(D,D);  
mat2 = zeros(D,K);

mat1 = x'*x;
mat2 = x'*mat;

wstar = (inv(mat1))*mat2;  
