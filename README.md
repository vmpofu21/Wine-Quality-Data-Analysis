# Wine Quality Data Analysis
<h1>Overview</h1>
This project analyzes the Wine Quality dataset using clustering techniques and linear regression. The two primary tasks of this project are:

<h3>Clustering Analysis </h3>: Applying the k-means clustering algorithm to identify potential patterns and grouping in the wine dataset based on selected features.
Data Fitting: Performing multiple linear regression using Gram-Schmidt orthogonalization to predict wine quality based on selected predictors.
Data
The dataset used is Wine Quality Data Set, which includes several physicochemical properties of wines and their corresponding quality ratings. The dataset contains 1143 rows and 12 columns. For this project, we focused on five key variables:

volatile acidity
citric acid
residual sugar
sulphates
alcohol
These variables are considered important in determining the quality of the wine.

<h3>Columns used in this project</h3>:
volatile acidity: The amount of acetic acid in wine, which can lead to an unpleasant vinegar taste in wine.
citric acid: Adds freshness and flavor to wine.
residual sugar: The amount of sugar remaining after fermentation stops.
sulphates: A wine additive that contributes to sulfur dioxide gas, which acts as an antimicrobial and antioxidant.
alcohol: The percentage of alcohol content in the wine.
Additionally, the quality column is used as the dependent variable for data fitting purposes.

<h2>Project Structure</h2>
<h3> 1. Clustering Analysis (Problem 1)</h3>
In the first section, we apply the k-means algorithm to perform clustering based on the selected variables:

First, we scale the data to normalize the range of each feature.
Then, the number of clusters is determined using the Elbow Method (visualized by fviz_nbclust from the factoextra package).
We apply the k-means algorithm with 5 clusters (centers=5).
The results of the k-means algorithm include:
tot.withinss: Total within-cluster sum of squares, measuring compactness.
size: Number of data points in each cluster.
centers: The centers of the clusters for each feature.
Finally, the dataset is augmented with a new cluster column, which assigns each wine to a cluster. The mean values of the variables for each cluster are then calculated.

<h3> 2. Data Fitting (Problem 2)</h3>
In the second section, we perform data fitting by predicting the wine quality using a multiple linear regression model. We use the following steps:

Construct the matrix A with selected features (pH, citric acid, residual sugar, sulphates, alcohol) and a column of ones for the intercept.
The target variable b is the wine quality.
We perform Gram-Schmidt orthogonalization to decompose the matrix A into orthogonal matrices Q and R.
The pseudo-inverse of A is computed using the formula psinvA = inv(R) %*% t(Q).
We then multiply the pseudo-inverse by the target variable b to estimate the regression coefficients.

<h2>Software and Libraries</h2>
R version 4.0+
Libraries:
readr: For reading CSV files.
factoextra: For visualizing clustering algorithms.
cluster: Clustering algorithms and validation methods.
pracma: Linear algebra methods like Gram-Schmidt orthogonalization.
