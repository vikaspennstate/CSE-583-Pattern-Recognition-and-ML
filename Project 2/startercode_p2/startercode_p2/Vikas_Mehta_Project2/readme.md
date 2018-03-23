
### Readme for Project 2

There are 2 folders and 1 report

1. Report contains experimental results and required proofs

2. Folder LSA: has files for Least Square operation.
It has following files:
start.m : to execute the code run this file
trainLeastSquare.m : This file returns the W weight matrix 
MyPredict.m This file contains code for calculating Y post calculation of W matrix
plotConfMat.m is used to plot confusion matrix
loadDataset.m is not changed and shoul pick data if provided.

On line 111 plotConfMat(train_ConfMat)
and 
112 plotConfMat(test_ConfMat); 
you can comment and uncomment code to verify the confusion matrix plot attached in the document.

 

 
3. Folder FLDA: has files for Fisher LDA operation.
It has following files:
start.m : to execute the code run this file
trainFisher.m : This file returns the W weight matrix post performing all eigen value operations 
knnclassifier.m This file contains code to knn classify the Y obtained from W matrix 
plotConfMat.m is used to plot confusion matrix
loadDataset.m is not changed and shoul pick data if provided.

On line 96 plotConfMat(train_ConfMat)
and 
97 plotConfMat(test_ConfMat); 
you can comment and uncomment code to verify the confusion matrix plot attached in the document.


****NOTE**** : Some images attached in the document may not be very intuitive because of data size. i request you to verify 
plotConfMat(train_ConfMat) and
plotConfMat(test_ConfMat)
yourself.
 
