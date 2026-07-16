# wpbc-logistic-pca-comparison
Accuracy comparison of two logistic regression models with and without PCA for Breast Cancer classification.

# Abstract
This project aim is to analyze how the use of dimensionality reduction via PCA affects the accuracy of a logistic regression model, whose aim is to detect breast cancer.

# Dataset description
The model has been trained by using the 'WPBC' MATLAB dataset, which consists of two different matrices:
* The X matrix represents the dataset on which the model will be trained. It is a 198x31 matrix of doubles, composed by 198 samples and 31 features.
* The Y matrix represents the output matrix: it is a 198x1 column vector, which contains the label  of every patient.

# Code description
The MATLAB code consists of different sections:
* The first part of the program loads the dataset and initializes it by setting the random number generator's seed to 7, allowing reproducibility and individuating the sample number.
* The second part, allows the division of the dataset in training set and testing set: due to its small number of samples and provided that our aim is not to hypertune the model, we don't need to create a validation set.
* 
