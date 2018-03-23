%starter code for project 2: linear classification
%pattern recognition, CSE583/EE552
%Weina Ge, Aug 2008
%Christopher Funk, Jan 2017


close all;
clear all;
addpath export_fig
% Choose which dataset to use (choices wine, wallpaper, taiji) :
dataset = 'wine';
[train_featureVector, train_labels, test_featureVector, test_labels] = loadDataset(dataset);

%% An example Linear Discriminant Classification


%  Classification here is based on 2 Features (featureA and feature B).  
%       You will be using all of the features but using 2 features makes it 
%       easier to visualize than the multidimensional hyperplane

%%
%temporarily make wine data for 2 classes
%train_featureVector = train_featureVector(1:66,:);

%test_featureVector = test_featureVector(1:64,:);
%train_labels = train_labels(1:66);
%test_labels = test_labels(1:64);
%%
featureA = 1;
featureB = 7;
%feature_idx = [featureA,featureB];
numGroups = length(countcats(test_labels));
%numGroups = 2;
% Uncomment the following line to use all features
feature_idx = 1:size(train_featureVector,2);

aug = ones(length(train_featureVector),1);
aug1 = ones(length(test_featureVector),1);

train_featureVector = [aug train_featureVector(:,feature_idx)];
test_featureVector = [aug1 test_featureVector(:,feature_idx)];

%%  Classify the data and show statistics
%    This example is using Matlab's inbuilt Classifier.
%        You do not need to follow their data management style, this is
%        to allow you to see the result and show some visualizations
%        of the classification
% Train the model (you will have to write this function)
Wstar = trainLeastSquare(train_featureVector,train_labels,numGroups);
%MdlLinear = fitcdiscr(train_featureVector,train_labels);

% Find the training accurracy (you will have to write predict function)
%train_pred = predict(MdlLinear,train_featureVector);
train_pred = MyPredict(Wstar,train_featureVector);
trueLabels = double(train_labels);



% Create confusion matrix
train_ConfMat = confusionmat(categorical(trueLabels),train_pred)
% Create classification matrix (rows should sum to 1)
train_ClassMat = train_ConfMat./(meshgrid(countcats(categorical(trueLabels)))')
% mean group accuracy and std
train_acc = mean(diag(train_ClassMat))
train_std = std(diag(train_ClassMat))

% Find the testing accurracy (you will have to write predict function)
%test_pred = predict(MdlLinear,test_featureVector);
test_pred = MyPredict(Wstar,test_featureVector);
testtruelabels = double(test_labels);
Y_predict_test=test_featureVector*Wstar;

X_test=test_featureVector(:,2:end);
X_test=[ones(length(X_test),1) X_test];
Y_predict_test=X_test*Wstar;
class_Y_Test=zeros(length(X_test),3);
for i=1:length(X_test)
   [max_value, index] = max(Y_predict_test(i,:));
    class_Y_Test(i,index)=1;
    class_Y_Test_V(i)=index;
end
T_test=test_featureVector(:,1);
T2=zeros(length(T_test),3);
for i=1:length(X_test)
    T2(i,T_test(i))=1;
end
z2=find((T_test==class_Y_Test_V')==0);


% Create confusion matrix
test_ConfMat = confusionmat(categorical(testtruelabels),test_pred)
% Create classification matrix (rows should sum to 1)
test_ClassMat = test_ConfMat./(meshgrid(countcats(categorical(testtruelabels)))')
% mean group accuracy and std
test_acc = mean(diag(test_ClassMat))
test_std = std(diag(test_ClassMat))


%figure(1)
%scatter3(Y_predict_test(:,1),Y_predict_test(:,2),Y_predict_test(:,3),T_test*40,T2,'LineWidth',3)

%hold on
%z2=find((T_test==class_Y_Test_V')==0);
%scatter3(Y_predict_test(z2,1),Y_predict_test(z2,2),Y_predict_test(z2,3),500*ones(length(z2),1),class_Y_Test(z2,:),'+','LineWidth',3)
%title('Test set prediction, Linear classifier')





%plotConfMat(train_ConfMat);
plotConfMat(test_ConfMat);

