function wstar = trainFisher(x,y,classes)

[samplesCount,featuresCount] = size(x);
y = double(y)
SW=zeros(featuresCount);

for i=1:classes
    mat=x(find(y(:,1)==i),1:end);
    m1=sum(mat)'/length(find(y(:,1)==1));
    mat=mat';
    SW=SW+(mat(:,i)-m1)*(mat(:,i)-m1)';
end
    
%calculate mean
mean=sum(x(:,1:end))'/length(x);
ST=zeros(featuresCount); 

% calculate ST 
for i=1:length(x)
    ST=ST+(x(i,1:end)'-mean)*(x(i,1:end)'-mean)';
end

SB=ST-SW;

% from section 4.1.6, calculate Wstar matrix
[V,D]=eig(inv(SW)*SB);
p=diag(D);
[dd,sort1] = sort(p,'descend');
wstar=V(:,sort1(1:classes-1));  %take only classes-1 classes



