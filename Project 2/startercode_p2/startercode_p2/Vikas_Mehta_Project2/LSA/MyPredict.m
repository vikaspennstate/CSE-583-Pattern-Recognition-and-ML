function train_pred = MyPredict(W,x)

train_pred = zeros(length(x),1)

for i=1:length(x)
    y = x(i,:);
    values = W'*y';
    [Max,I] = max(values);
    train_pred(i) = I;
end

train_pred = categorical(train_pred);  %categorical for data type  
