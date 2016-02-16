##  Introduction

This application enables the user to change the number of k-means centers of the diabetes dataset to find the most distinguished clusters, or to discover any pattern between data. There are 786 samples in the dataset and 8 attributes, and a 9th attribute denoting the classification.

## Attributes: (all numeric-valued)

   1. Number of times pregnant
   2. Plasma glucose concentration a 2 hours in an oral glucose tolerance test
   3. Diastolic blood pressure (mm Hg)
   4. Triceps skin fold thickness (mm)
   5. 2-Hour serum insulin (mu U/ml)
   6. Body mass index (weight in kg/(height in m)^2)
   7. Diabetes pedigree function
   8. Age (years)
   9. Class variable (0 or 1)

## K-Means Clustering

K-means is a widely used method in cluster analysis. It is a method of classifying items into **k** groups. The grouping is done by minimizing the sum of squared distances (Euclidean distances) between items and the corresponding centroid (the point in the middle of the cluster).

## Principal Component Analysis (PCA)

PCA is a dimensionality reducing algorithm that computes a weigted list of correlated attributes into several principal components, where the resulting components usually act as better attributes. 

## Using the Application

In this application, the number of clusters **k** will be user-controlled, alongside choose which attribute set (either the PCAs or the individual attributes) to be shown in the graph. 
 
## Credits

The diabetes dataset is credited to [UCI machine learning database repository](http://archive.ics.uci.edu/ml/datasets/Pima+Indians+Diabetes).

