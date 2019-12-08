---
title: "Wisconsin Cancer Data Analysis"
author: "Emily Armbruster"
output: 
  html_document: 
    keep_md: yes
---



# Wisconsin Cancer Data Analysis

##### Create dataframe of this data...

```r
wisc.df <- read.csv("WisconsinCancer.csv")
```

##### Look at data


```r
head(wisc.df)
```

```
##         id diagnosis radius_mean texture_mean perimeter_mean area_mean
## 1   842302         M       17.99        10.38         122.80    1001.0
## 2   842517         M       20.57        17.77         132.90    1326.0
## 3 84300903         M       19.69        21.25         130.00    1203.0
## 4 84348301         M       11.42        20.38          77.58     386.1
## 5 84358402         M       20.29        14.34         135.10    1297.0
## 6   843786         M       12.45        15.70          82.57     477.1
##   smoothness_mean compactness_mean concavity_mean concave.points_mean
## 1         0.11840          0.27760         0.3001             0.14710
## 2         0.08474          0.07864         0.0869             0.07017
## 3         0.10960          0.15990         0.1974             0.12790
## 4         0.14250          0.28390         0.2414             0.10520
## 5         0.10030          0.13280         0.1980             0.10430
## 6         0.12780          0.17000         0.1578             0.08089
##   symmetry_mean fractal_dimension_mean radius_se texture_se perimeter_se
## 1        0.2419                0.07871    1.0950     0.9053        8.589
## 2        0.1812                0.05667    0.5435     0.7339        3.398
## 3        0.2069                0.05999    0.7456     0.7869        4.585
## 4        0.2597                0.09744    0.4956     1.1560        3.445
## 5        0.1809                0.05883    0.7572     0.7813        5.438
## 6        0.2087                0.07613    0.3345     0.8902        2.217
##   area_se smoothness_se compactness_se concavity_se concave.points_se
## 1  153.40      0.006399        0.04904      0.05373           0.01587
## 2   74.08      0.005225        0.01308      0.01860           0.01340
## 3   94.03      0.006150        0.04006      0.03832           0.02058
## 4   27.23      0.009110        0.07458      0.05661           0.01867
## 5   94.44      0.011490        0.02461      0.05688           0.01885
## 6   27.19      0.007510        0.03345      0.03672           0.01137
##   symmetry_se fractal_dimension_se radius_worst texture_worst
## 1     0.03003             0.006193        25.38         17.33
## 2     0.01389             0.003532        24.99         23.41
## 3     0.02250             0.004571        23.57         25.53
## 4     0.05963             0.009208        14.91         26.50
## 5     0.01756             0.005115        22.54         16.67
## 6     0.02165             0.005082        15.47         23.75
##   perimeter_worst area_worst smoothness_worst compactness_worst
## 1          184.60     2019.0           0.1622            0.6656
## 2          158.80     1956.0           0.1238            0.1866
## 3          152.50     1709.0           0.1444            0.4245
## 4           98.87      567.7           0.2098            0.8663
## 5          152.20     1575.0           0.1374            0.2050
## 6          103.40      741.6           0.1791            0.5249
##   concavity_worst concave.points_worst symmetry_worst
## 1          0.7119               0.2654         0.4601
## 2          0.2416               0.1860         0.2750
## 3          0.4504               0.2430         0.3613
## 4          0.6869               0.2575         0.6638
## 5          0.4000               0.1625         0.2364
## 6          0.5355               0.1741         0.3985
##   fractal_dimension_worst
## 1                 0.11890
## 2                 0.08902
## 3                 0.08758
## 4                 0.17300
## 5                 0.07678
## 6                 0.12440
```

##### How many observations do we have?


```r
str(wisc.df)
```

```
## 'data.frame':	569 obs. of  32 variables:
##  $ id                     : int  842302 842517 84300903 84348301 84358402 843786 844359 84458202 844981 84501001 ...
##  $ diagnosis              : Factor w/ 2 levels "B","M": 2 2 2 2 2 2 2 2 2 2 ...
##  $ radius_mean            : num  18 20.6 19.7 11.4 20.3 ...
##  $ texture_mean           : num  10.4 17.8 21.2 20.4 14.3 ...
##  $ perimeter_mean         : num  122.8 132.9 130 77.6 135.1 ...
##  $ area_mean              : num  1001 1326 1203 386 1297 ...
##  $ smoothness_mean        : num  0.1184 0.0847 0.1096 0.1425 0.1003 ...
##  $ compactness_mean       : num  0.2776 0.0786 0.1599 0.2839 0.1328 ...
##  $ concavity_mean         : num  0.3001 0.0869 0.1974 0.2414 0.198 ...
##  $ concave.points_mean    : num  0.1471 0.0702 0.1279 0.1052 0.1043 ...
##  $ symmetry_mean          : num  0.242 0.181 0.207 0.26 0.181 ...
##  $ fractal_dimension_mean : num  0.0787 0.0567 0.06 0.0974 0.0588 ...
##  $ radius_se              : num  1.095 0.543 0.746 0.496 0.757 ...
##  $ texture_se             : num  0.905 0.734 0.787 1.156 0.781 ...
##  $ perimeter_se           : num  8.59 3.4 4.58 3.44 5.44 ...
##  $ area_se                : num  153.4 74.1 94 27.2 94.4 ...
##  $ smoothness_se          : num  0.0064 0.00522 0.00615 0.00911 0.01149 ...
##  $ compactness_se         : num  0.049 0.0131 0.0401 0.0746 0.0246 ...
##  $ concavity_se           : num  0.0537 0.0186 0.0383 0.0566 0.0569 ...
##  $ concave.points_se      : num  0.0159 0.0134 0.0206 0.0187 0.0188 ...
##  $ symmetry_se            : num  0.03 0.0139 0.0225 0.0596 0.0176 ...
##  $ fractal_dimension_se   : num  0.00619 0.00353 0.00457 0.00921 0.00511 ...
##  $ radius_worst           : num  25.4 25 23.6 14.9 22.5 ...
##  $ texture_worst          : num  17.3 23.4 25.5 26.5 16.7 ...
##  $ perimeter_worst        : num  184.6 158.8 152.5 98.9 152.2 ...
##  $ area_worst             : num  2019 1956 1709 568 1575 ...
##  $ smoothness_worst       : num  0.162 0.124 0.144 0.21 0.137 ...
##  $ compactness_worst      : num  0.666 0.187 0.424 0.866 0.205 ...
##  $ concavity_worst        : num  0.712 0.242 0.45 0.687 0.4 ...
##  $ concave.points_worst   : num  0.265 0.186 0.243 0.258 0.163 ...
##  $ symmetry_worst         : num  0.46 0.275 0.361 0.664 0.236 ...
##  $ fractal_dimension_worst: num  0.1189 0.089 0.0876 0.173 0.0768 ...
```

##### We have 569 observations (samples)

##### We want R to print information from the dataframe in some text... Here we examine data from 569 patient samples.


```r
table(wisc.df$diagnosis)
```

```
## 
##   B   M 
## 357 212
```


```r
diagnosis <- wisc.df$diagnosis

diagnosis["B"]
```

```
## [1] <NA>
## Levels: B M
```

```r
diagnosis["M"]
```

```
## [1] <NA>
## Levels: B M
```

#### In this data set we have NA cancer and NA non - cancer. How many variables/features in the data are suffixed with _mean? 


```r
colnames(wisc.df)
```

```
##  [1] "id"                      "diagnosis"              
##  [3] "radius_mean"             "texture_mean"           
##  [5] "perimeter_mean"          "area_mean"              
##  [7] "smoothness_mean"         "compactness_mean"       
##  [9] "concavity_mean"          "concave.points_mean"    
## [11] "symmetry_mean"           "fractal_dimension_mean" 
## [13] "radius_se"               "texture_se"             
## [15] "perimeter_se"            "area_se"                
## [17] "smoothness_se"           "compactness_se"         
## [19] "concavity_se"            "concave.points_se"      
## [21] "symmetry_se"             "fractal_dimension_se"   
## [23] "radius_worst"            "texture_worst"          
## [25] "perimeter_worst"         "area_worst"             
## [27] "smoothness_worst"        "compactness_worst"      
## [29] "concavity_worst"         "concave.points_worst"   
## [31] "symmetry_worst"          "fractal_dimension_worst"
```

##### We have 31 variables.

##### Use grep function to select columns! grep() returns the indices corresponding to each column that has "_mean". We can use the length() function to then find out how many rows end in "_mean".


```r
grep("_mean", colnames(wisc.df))
```

```
##  [1]  3  4  5  6  7  8  9 10 11 12
```


```r
length(grep("_mean", colnames(wisc.df)))
```

```
## [1] 10
```

# Now we want to do PCA on the data!

##### Find the standard deviation and mean of each column. The round() function second argument tells R how many decimal places to round to.

#### Apply function arguments: "apply standard deviation over the columns of the wisc.data"


```r
wisc.data <- as.matrix(wisc.df[,3:32])
  
round( apply(wisc.data, 2, sd), 3)
```

```
##             radius_mean            texture_mean          perimeter_mean 
##                   3.524                   4.301                  24.299 
##               area_mean         smoothness_mean        compactness_mean 
##                 351.914                   0.014                   0.053 
##          concavity_mean     concave.points_mean           symmetry_mean 
##                   0.080                   0.039                   0.027 
##  fractal_dimension_mean               radius_se              texture_se 
##                   0.007                   0.277                   0.552 
##            perimeter_se                 area_se           smoothness_se 
##                   2.022                  45.491                   0.003 
##          compactness_se            concavity_se       concave.points_se 
##                   0.018                   0.030                   0.006 
##             symmetry_se    fractal_dimension_se            radius_worst 
##                   0.008                   0.003                   4.833 
##           texture_worst         perimeter_worst              area_worst 
##                   6.146                  33.603                 569.357 
##        smoothness_worst       compactness_worst         concavity_worst 
##                   0.023                   0.157                   0.209 
##    concave.points_worst          symmetry_worst fractal_dimension_worst 
##                   0.066                   0.062                   0.018
```

##### Now let's use the prcomp() function to conduct PCA:


```r
wisc.pr <- prcomp(wisc.data, scale=TRUE)
summary(wisc.pr)
```

```
## Importance of components:
##                           PC1    PC2     PC3     PC4     PC5     PC6
## Standard deviation     3.6444 2.3857 1.67867 1.40735 1.28403 1.09880
## Proportion of Variance 0.4427 0.1897 0.09393 0.06602 0.05496 0.04025
## Cumulative Proportion  0.4427 0.6324 0.72636 0.79239 0.84734 0.88759
##                            PC7     PC8    PC9    PC10   PC11    PC12
## Standard deviation     0.82172 0.69037 0.6457 0.59219 0.5421 0.51104
## Proportion of Variance 0.02251 0.01589 0.0139 0.01169 0.0098 0.00871
## Cumulative Proportion  0.91010 0.92598 0.9399 0.95157 0.9614 0.97007
##                           PC13    PC14    PC15    PC16    PC17    PC18
## Standard deviation     0.49128 0.39624 0.30681 0.28260 0.24372 0.22939
## Proportion of Variance 0.00805 0.00523 0.00314 0.00266 0.00198 0.00175
## Cumulative Proportion  0.97812 0.98335 0.98649 0.98915 0.99113 0.99288
##                           PC19    PC20   PC21    PC22    PC23   PC24
## Standard deviation     0.22244 0.17652 0.1731 0.16565 0.15602 0.1344
## Proportion of Variance 0.00165 0.00104 0.0010 0.00091 0.00081 0.0006
## Cumulative Proportion  0.99453 0.99557 0.9966 0.99749 0.99830 0.9989
##                           PC25    PC26    PC27    PC28    PC29    PC30
## Standard deviation     0.12442 0.09043 0.08307 0.03987 0.02736 0.01153
## Proportion of Variance 0.00052 0.00027 0.00023 0.00005 0.00002 0.00000
## Cumulative Proportion  0.99942 0.99969 0.99992 0.99997 1.00000 1.00000
```

##### R generated 30 PCs. The amount of variance captured by one PC is the "cumulative proportion"

##### Plot PC1 vs PC2 and color by M/B cancer/Non-cancer diagnosis.


```r
plot(wisc.pr$x[,1], wisc.pr$x[,2])
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-11-1.png)<!-- -->

```r
diagnosis_plot <- wisc.df$diagnosis
plot(wisc.pr$x[,1:2], col = diagnosis_plot)
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-11-2.png)<!-- -->
##### We see that the benign tumor samples are all similar, but the malignant ones are very different from normal cells and from each other. 


```r
x <- summary(wisc.pr) 
x$importance[,"PC1"]
```

```
##     Standard deviation Proportion of Variance  Cumulative Proportion 
##               3.644394               0.442720               0.442720
```


```r
x$importance[3,] > 0.7
```

```
##   PC1   PC2   PC3   PC4   PC5   PC6   PC7   PC8   PC9  PC10  PC11  PC12 
## FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
##  PC13  PC14  PC15  PC16  PC17  PC18  PC19  PC20  PC21  PC22  PC23  PC24 
##  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
##  PC25  PC26  PC27  PC28  PC29  PC30 
##  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```


```r
x$importance[3,] > 0.7
```

```
##   PC1   PC2   PC3   PC4   PC5   PC6   PC7   PC8   PC9  PC10  PC11  PC12 
## FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
##  PC13  PC14  PC15  PC16  PC17  PC18  PC19  PC20  PC21  PC22  PC23  PC24 
##  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE 
##  PC25  PC26  PC27  PC28  PC29  PC30 
##  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
```

##### Use which function to select TRUE options


```r
which(x$importance[3,] > 0.7)
```

```
##  PC3  PC4  PC5  PC6  PC7  PC8  PC9 PC10 PC11 PC12 PC13 PC14 PC15 PC16 PC17 
##    3    4    5    6    7    8    9   10   11   12   13   14   15   16   17 
## PC18 PC19 PC20 PC21 PC22 PC23 PC24 PC25 PC26 PC27 PC28 PC29 PC30 
##   18   19   20   21   22   23   24   25   26   27   28   29   30
```

# Part 3 of handout:

##### First we need to scale the data.


```r
data.scaled <- scale(wisc.data)
```

##### Then find distance between scaled pairs of observations:


```r
data.dist <- dist(data.scaled)
```

##### Now make hierachical model with complete linkage. Specify the method!

```r
wisc.hclust <- hclust(data.dist, method = "complete")
```

##### ... And plot the hc and select cutting location:


```r
plot(wisc.hclust)
abline(h=20, col="red", lty=2)
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-19-1.png)<!-- -->

##### Now we can see where we want to cut the tree to generate four clusters, cut the tree!


```r
wisc.hclust.clusters <- cutree(wisc.hclust, k = 4)
```

##### Use a table to compare whether the different diagnoses are more or less represented in different clusters:


```r
table(wisc.hclust.clusters, diagnosis)
```

```
##                     diagnosis
## wisc.hclust.clusters   B   M
##                    1  12 165
##                    2   2   5
##                    3 343  40
##                    4   0   2
```

##### Can you make the prediction better with a different number of clusters?


```r
wisc.hclust.clusters.k2 <- cutree(wisc.hclust, k = 2)
table(wisc.hclust.clusters.k2, diagnosis)
```

```
##                        diagnosis
## wisc.hclust.clusters.k2   B   M
##                       1 357 210
##                       2   0   2
```

##### That's a lot worse.


```r
wisc.hclust.clusters.k5 <- cutree(wisc.hclust, k = 5)
table(wisc.hclust.clusters.k5, diagnosis)
```

```
##                        diagnosis
## wisc.hclust.clusters.k5   B   M
##                       1  12 165
##                       2   0   5
##                       3 343  40
##                       4   2   0
##                       5   0   2
```


```r
wisc.hclust.clusters.k8 <- cutree(wisc.hclust, k = 8)
table(wisc.hclust.clusters.k8, diagnosis)
```

```
##                        diagnosis
## wisc.hclust.clusters.k8   B   M
##                       1  12  86
##                       2   0  79
##                       3   0   3
##                       4 331  39
##                       5   2   0
##                       6  12   1
##                       7   0   2
##                       8   0   2
```

# Combining methods:

##### First cluster!


```r
wisc.pr.hclust <- hclust(data.dist, method = "ward.D2")
```

##### Cut the tree


```r
grps <- cutree(wisc.pr.hclust, k=2)
table(grps)
```

```
## grps
##   1   2 
## 184 385
```

##### Compare to diagnosis:


```r
table(grps, diagnosis)
```

```
##     diagnosis
## grps   B   M
##    1  20 164
##    2 337  48
```

##### Make a plot of this! Compare coloring by groups with coloring by diagnosis


```r
plot(wisc.pr$x[,1:2], col=grps)
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-28-1.png)<!-- -->

```r
plot(wisc.pr$x[,1:2], col=diagnosis)
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-28-2.png)<!-- -->

##### Hm, looks like the colors have been swapped... Let's make them match by turning groups into a factor and reorder levels...


```r
g <- as.factor(grps)
levels(g)
```

```
## [1] "1" "2"
```

```r
grelevel <- relevel(g, 2)
levels(grelevel)
```

```
## [1] "2" "1"
```

##### Try plotting again:

```r
plot(wisc.pr$x[,1:2], col = grelevel)
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-30-1.png)<!-- -->

```r
plot(wisc.pr$x[,1:2], col=diagnosis)
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-30-2.png)<!-- -->

# Section 7: Prediction

##### Use the 'predict()' function to take previously made PCA model and some new cancer data...


```r
url <- "https://tinyurl.com/new-samples-CSV"
new <- read.csv(url)
npc <- predict(wisc.pr, newdata=new)
npc
```

```
##            PC1       PC2        PC3        PC4       PC5        PC6
## [1,]  2.576616 -3.135913  1.3990492 -0.7631950  2.781648 -0.8150185
## [2,] -4.754928 -3.009033 -0.1660946 -0.6052952 -1.140698 -1.2189945
##             PC7        PC8       PC9       PC10      PC11      PC12
## [1,] -0.3959098 -0.2307350 0.1029569 -0.9272861 0.3411457  0.375921
## [2,]  0.8193031 -0.3307423 0.5281896 -0.4855301 0.7173233 -1.185917
##           PC13     PC14      PC15       PC16        PC17        PC18
## [1,] 0.1610764 1.187882 0.3216974 -0.1743616 -0.07875393 -0.11207028
## [2,] 0.5893856 0.303029 0.1299153  0.1448061 -0.40509706  0.06565549
##             PC19       PC20       PC21       PC22       PC23       PC24
## [1,] -0.08802955 -0.2495216  0.1228233 0.09358453 0.08347651  0.1223396
## [2,]  0.25591230 -0.4289500 -0.1224776 0.01732146 0.06316631 -0.2338618
##             PC25         PC26         PC27        PC28         PC29
## [1,]  0.02124121  0.078884581  0.220199544 -0.02946023 -0.015620933
## [2,] -0.20755948 -0.009833238 -0.001134152  0.09638361  0.002795349
##              PC30
## [1,]  0.005269029
## [2,] -0.019015820
```

```r
plot(wisc.pr$x[,1:2], col=grelevel)
points(npc[,1], npc[,2], col="blue", pch=16, cex=3)
text(npc[,1], npc[,2], c(1,2), col="white")
```

![](Wisconsin-Cancer-Data-Analysis_files/figure-html/unnamed-chunk-31-1.png)<!-- -->

