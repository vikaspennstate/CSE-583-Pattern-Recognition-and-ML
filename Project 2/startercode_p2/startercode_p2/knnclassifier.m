function final = knnclassifier(Xtest,Xtrain,Ytrain, K)

trainCount = length(Ytrain);
class = unique(Ytrain);

testCount = size(Xtest,1);
final = zeros(testCount,1);

for i=1:testCount
   dist = sum((Xtrain-ones(trainCount,1)*Xtest(i,:)).^2,2);
   [a,indices] = sort(dist);
   n = hist(Ytrain(indices(1:K)),class);
   [b,best] = max(n);
   final(i) = class(best);
end
final = categorical(final);
end