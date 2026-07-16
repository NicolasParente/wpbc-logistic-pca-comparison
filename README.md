# wpbc-logistic-pca-comparison
Accuracy comparison of two logistic regression models with and without PCA for Breast Cancer classification.

## Abstract
This project aims to analyze how the use of dimensionality reduction via Principal Component Analysis (PCA) affects the accuracy of a logistic regression model designed to detect breast cancer.

## Dataset Description
The model is trained using the built-in MATLAB `wpbc.mat` dataset, which consists of two distinct matrices:
* The **X matrix** represents the dataset on which the model is trained. It is a 198x31 matrix of doubles, composed of 198 samples and 31 features.
* The **Y matrix** represents the output labels. It is a 198x1 column vector containing the ground truth diagnosis for every patient.

## Code Description
The MATLAB script is logically divided into several sections:
* **Initialization:** Loads the dataset and initializes the random number generator's seed to `rng(7)`, ensuring the full reproducibility of the data split.
* **Data Splitting:** Divides the dataset into a Training Set and a Testing Set. Due to the small number of samples and given that hyperparameter tuning is not the primary goal, a separate validation set is not required.
* **Dimensionality Reduction (PCA):** Reduces the dataset's dimensionality by applying the PCA algorithm, retaining >95% of the original variance.
* **Original Model Training:** Trains a baseline logistic regression model using the original high-dimensional training set, uses it to predict the testing set, and validates it through a Confusion Matrix.
* **PCA Model Training:** Trains a second logistic regression model using the PCA-reduced dataset, predicts the reduced testing set, and validates it through a second Confusion Matrix.

## Conclusions 
The model trained with the original dataset produces the following results:

<img width="406" height="247" alt="Figure_1" src="https://github.com/user-attachments/assets/a80c2b97-0e0f-455c-ac0d-8a68c3f02628" />

Whereas the model trained using the PCA-reduced dataset provides the following results:

<img width="406" height="247" alt="Figure_2" src="https://github.com/user-attachments/assets/892a3574-e5b8-4651-abb3-62df37913a4d" />

These plots clearly show how the use of PCA grants fewer false positives, effectively reducing the **Type I error**. The same conclusion is supported by analyzing the overall model accuracy, which jumps from **0.7436** (raw data) to **0.8205** (reduced data). 

## How to Run
In order to run the program:
1. Clone or download this repository to your local machine.
2. Ensure you have the **Statistics and Machine Learning Toolbox** installed in MATLAB.
3. Open the main script and click Run (the `wpbc.mat` dataset is built-in and will load automatically).
