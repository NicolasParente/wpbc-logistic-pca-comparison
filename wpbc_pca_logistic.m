% Data loading
load wpbc.mat

% Data split configuration
m = size(x, 1) ;
rng(7) ;

% Data split in training and test set
p = 0.2 ;
cv = cvpartition(m, "HoldOut", p) ;
idx = training(cv) ;
idx_train = find(idx) ;
idx_test = find(~idx) ;
x_train = x(idx_train, :) ;
x_test = x(idx_test, :) ;
y_train = y(idx_train, :) ;
y_test = y(idx_test, :) ;

% PCA space creation
x_train_centered = x_train - mean(x_train) ;
[coeff, scores, latent, tsquared, explained, mu] = pca(x_train_centered, 'Centered', false)  ;
cum_var = cumsum(explained) ;
num_pc = find(cum_var>95, 1) ;
fprintf('Number of principal components needed to ensure variance > 95: %d\n', num_pc);

% Train data projection on PCA space
x_train_pca = x_train_centered*coeff ;
x_train_pca_reduced = x_train_pca(:,1:num_pc) ; 

% Test data projection on PCA space
x_test_centered = x_test - mean(x_train) ;
x_test_pca = x_test_centered*coeff ;
x_test_pca_reduced = x_test_pca(:, 1:num_pc) ;


% Logistic regression model trained with original data 
model_og = fitclinear(x_train, y_train, 'Learner', 'logistic') ;
[y_pred, score_pred] = model_og.predict(x_test) ;
cm = confusionmat(y_test, y_pred) ;
figure(1)
confusionchart(cm, {'Benign (Negative)','Malignant (Positive)'})
title("Logistic regression with original data")
tn = cm(1,1) ;
fp = cm(1, 2) ;
fn = cm(2, 1) ;
tp = cm(2,2) ;
accuracy = (tp+tn)/(tp+tn+fp+fn) ;

% Logistic regression model trained with reduced data
model_red = fitclinear(x_train_pca_reduced, y_train, 'Learner','logistic') ;
[y_pred_pca, scores_red_pca] = model_red.predict(x_test_pca_reduced) ;
cm_red = confusionmat(y_test, y_pred_pca) ;
figure(2)
confusionchart(cm_red, {'Benign (Negative)','Malignant (Positive)'}) 
title("Logistic regression with reduced data")
tn = cm_red(1,1) ;
fp = cm_red(1, 2) ;
fn = cm_red(2, 1) ;
tp = cm_red(2,2) ;
accuracy_pca = (tp+tn)/(tp+tn+fp+fn) ;
fprintf("\nAccuracy without PCA: %.4f\nAccuracy with PCA: %.4f", accuracy, accuracy_pca)
