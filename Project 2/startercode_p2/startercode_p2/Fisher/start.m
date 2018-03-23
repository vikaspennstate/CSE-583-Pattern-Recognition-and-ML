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

featureA = 1;
featureB = 7;
%feature_idx = [featureA,featureB];
numGroups = length(countcats(test_labels));
% Uncomment the following line to use all features
feature_idx = 1:size(train_featureVector,2);

aug = ones(size(train_featureVector, 1), 1);
aug1 = ones(size(test_featureVector, 1), 1);


train_featureVector =train_featureVector(:,feature_idx);
test_featureVector =test_featureVector(:,feature_idx);



%%  Classify the data and show statistics
%    This example is using Matlab's inbuilt Classifier.
%        You do not need to follow their data management style, this is
%        to allow you to see the result and show some visualizations
%        of the classification
% Train the model (you will have to write this function)
%MdlLinear = fitcdiscr(train_featureVector,train_labels);
Wstar = trainFisher(train_featureVector,train_labels,numGroups);


% Find the training accurracy (you will have to write predict function)
%train_pred = predict(MdlLinear,train_featureVector);
YforTraining = train_featureVector*Wstar;

trueLabels = double(train_labels);
train_pred = knnclassifier(YforTraining,YforTraining,trueLabels(:,1),1);

%train_pred = knnclassifier([train_featureVector,train_featureVector,1]);


ss = unique(train_pred);
% Create confusion matrix
train_ConfMat = confusionmat(categorical(trueLabels),train_pred);
% Create classification matrix (rows should sum to 1)
train_ClassMat = train_ConfMat./(meshgrid(countcats(categorical(trueLabels)))')
% mean group accuracy and std
train_acc = mean(diag(train_ClassMat))
train_std = std(diag(train_ClassMat))

plotConfMat(train_ConfMat);


YforTesting = test_featureVector*Wstar;
% Find the testing accurracy (you will have to write predict function)
%test_pred = predict(MdlLinear,test_featureVector);

test_pred = knnclassifier(YforTesting,YforTraining,trueLabels(:,1),5);

testtruelabels = double(test_labels);
% Create confusion matrix
test_ConfMat = confusionmat(categorical(testtruelabels),test_pred)
% Create classification matrix (rows should sum to 1)
test_ClassMat = test_ConfMat./(meshgrid(countcats(categorical(testtruelabels)))')
% mean group accuracy and std
test_acc = mean(diag(test_ClassMat))
test_std = std(diag(test_ClassMat))

%  n(test_ConfMat);

%plotConfMat(test_ConfMat);

