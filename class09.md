Class 09: Unsupervised Learning Analysis of Human Breast Cancer Cells
================
Ivy Fernandes
2/8/2019

### Exploratory Data Analysis

``` r
wisc.df<-read.csv("WisconsinCancer.csv")
```

Viewed the file to make sure everything was imported correctly

``` r
fna.data<-read.csv("WisconsinCancer.csv")
```

There is a funny last column labeled "X" filled with NA

Checking the amount of patients

``` r
nrow(fna.data)
```

    ## [1] 569

Figure out how many factors / columns

``` r
ncol(fna.data)
```

    ## [1] 33

Because we will not be using the ID and the diagnosis columns that much and because we don't want the weird column at the end, want to save only the data from columns 3 to 32 into a matrix

``` r
wisc.data<-as.matrix(fna.data[,3:32])
head(wisc.data)
```

    ##      radius_mean texture_mean perimeter_mean area_mean smoothness_mean
    ## [1,]       17.99        10.38         122.80    1001.0         0.11840
    ## [2,]       20.57        17.77         132.90    1326.0         0.08474
    ## [3,]       19.69        21.25         130.00    1203.0         0.10960
    ## [4,]       11.42        20.38          77.58     386.1         0.14250
    ## [5,]       20.29        14.34         135.10    1297.0         0.10030
    ## [6,]       12.45        15.70          82.57     477.1         0.12780
    ##      compactness_mean concavity_mean concave.points_mean symmetry_mean
    ## [1,]          0.27760         0.3001             0.14710        0.2419
    ## [2,]          0.07864         0.0869             0.07017        0.1812
    ## [3,]          0.15990         0.1974             0.12790        0.2069
    ## [4,]          0.28390         0.2414             0.10520        0.2597
    ## [5,]          0.13280         0.1980             0.10430        0.1809
    ## [6,]          0.17000         0.1578             0.08089        0.2087
    ##      fractal_dimension_mean radius_se texture_se perimeter_se area_se
    ## [1,]                0.07871    1.0950     0.9053        8.589  153.40
    ## [2,]                0.05667    0.5435     0.7339        3.398   74.08
    ## [3,]                0.05999    0.7456     0.7869        4.585   94.03
    ## [4,]                0.09744    0.4956     1.1560        3.445   27.23
    ## [5,]                0.05883    0.7572     0.7813        5.438   94.44
    ## [6,]                0.07613    0.3345     0.8902        2.217   27.19
    ##      smoothness_se compactness_se concavity_se concave.points_se
    ## [1,]      0.006399        0.04904      0.05373           0.01587
    ## [2,]      0.005225        0.01308      0.01860           0.01340
    ## [3,]      0.006150        0.04006      0.03832           0.02058
    ## [4,]      0.009110        0.07458      0.05661           0.01867
    ## [5,]      0.011490        0.02461      0.05688           0.01885
    ## [6,]      0.007510        0.03345      0.03672           0.01137
    ##      symmetry_se fractal_dimension_se radius_worst texture_worst
    ## [1,]     0.03003             0.006193        25.38         17.33
    ## [2,]     0.01389             0.003532        24.99         23.41
    ## [3,]     0.02250             0.004571        23.57         25.53
    ## [4,]     0.05963             0.009208        14.91         26.50
    ## [5,]     0.01756             0.005115        22.54         16.67
    ## [6,]     0.02165             0.005082        15.47         23.75
    ##      perimeter_worst area_worst smoothness_worst compactness_worst
    ## [1,]          184.60     2019.0           0.1622            0.6656
    ## [2,]          158.80     1956.0           0.1238            0.1866
    ## [3,]          152.50     1709.0           0.1444            0.4245
    ## [4,]           98.87      567.7           0.2098            0.8663
    ## [5,]          152.20     1575.0           0.1374            0.2050
    ## [6,]          103.40      741.6           0.1791            0.5249
    ##      concavity_worst concave.points_worst symmetry_worst
    ## [1,]          0.7119               0.2654         0.4601
    ## [2,]          0.2416               0.1860         0.2750
    ## [3,]          0.4504               0.2430         0.3613
    ## [4,]          0.6869               0.2575         0.6638
    ## [5,]          0.4000               0.1625         0.2364
    ## [6,]          0.5355               0.1741         0.3985
    ##      fractal_dimension_worst
    ## [1,]                 0.11890
    ## [2,]                 0.08902
    ## [3,]                 0.08758
    ## [4,]                 0.17300
    ## [5,]                 0.07678
    ## [6,]                 0.12440

we don't want to use the id in the MODEL, but we can set the row names to be the ID number

``` r
rownames(wisc.data)<-wisc.df$id
head(wisc.data)
```

    ##          radius_mean texture_mean perimeter_mean area_mean smoothness_mean
    ## 842302         17.99        10.38         122.80    1001.0         0.11840
    ## 842517         20.57        17.77         132.90    1326.0         0.08474
    ## 84300903       19.69        21.25         130.00    1203.0         0.10960
    ## 84348301       11.42        20.38          77.58     386.1         0.14250
    ## 84358402       20.29        14.34         135.10    1297.0         0.10030
    ## 843786         12.45        15.70          82.57     477.1         0.12780
    ##          compactness_mean concavity_mean concave.points_mean symmetry_mean
    ## 842302            0.27760         0.3001             0.14710        0.2419
    ## 842517            0.07864         0.0869             0.07017        0.1812
    ## 84300903          0.15990         0.1974             0.12790        0.2069
    ## 84348301          0.28390         0.2414             0.10520        0.2597
    ## 84358402          0.13280         0.1980             0.10430        0.1809
    ## 843786            0.17000         0.1578             0.08089        0.2087
    ##          fractal_dimension_mean radius_se texture_se perimeter_se area_se
    ## 842302                  0.07871    1.0950     0.9053        8.589  153.40
    ## 842517                  0.05667    0.5435     0.7339        3.398   74.08
    ## 84300903                0.05999    0.7456     0.7869        4.585   94.03
    ## 84348301                0.09744    0.4956     1.1560        3.445   27.23
    ## 84358402                0.05883    0.7572     0.7813        5.438   94.44
    ## 843786                  0.07613    0.3345     0.8902        2.217   27.19
    ##          smoothness_se compactness_se concavity_se concave.points_se
    ## 842302        0.006399        0.04904      0.05373           0.01587
    ## 842517        0.005225        0.01308      0.01860           0.01340
    ## 84300903      0.006150        0.04006      0.03832           0.02058
    ## 84348301      0.009110        0.07458      0.05661           0.01867
    ## 84358402      0.011490        0.02461      0.05688           0.01885
    ## 843786        0.007510        0.03345      0.03672           0.01137
    ##          symmetry_se fractal_dimension_se radius_worst texture_worst
    ## 842302       0.03003             0.006193        25.38         17.33
    ## 842517       0.01389             0.003532        24.99         23.41
    ## 84300903     0.02250             0.004571        23.57         25.53
    ## 84348301     0.05963             0.009208        14.91         26.50
    ## 84358402     0.01756             0.005115        22.54         16.67
    ## 843786       0.02165             0.005082        15.47         23.75
    ##          perimeter_worst area_worst smoothness_worst compactness_worst
    ## 842302            184.60     2019.0           0.1622            0.6656
    ## 842517            158.80     1956.0           0.1238            0.1866
    ## 84300903          152.50     1709.0           0.1444            0.4245
    ## 84348301           98.87      567.7           0.2098            0.8663
    ## 84358402          152.20     1575.0           0.1374            0.2050
    ## 843786            103.40      741.6           0.1791            0.5249
    ##          concavity_worst concave.points_worst symmetry_worst
    ## 842302            0.7119               0.2654         0.4601
    ## 842517            0.2416               0.1860         0.2750
    ## 84300903          0.4504               0.2430         0.3613
    ## 84348301          0.6869               0.2575         0.6638
    ## 84358402          0.4000               0.1625         0.2364
    ## 843786            0.5355               0.1741         0.3985
    ##          fractal_dimension_worst
    ## 842302                   0.11890
    ## 842517                   0.08902
    ## 84300903                 0.08758
    ## 84348301                 0.17300
    ## 84358402                 0.07678
    ## 843786                   0.12440

want to figure out how many patients have cancer / no cancer (malignant vs benign)

``` r
table(wisc.df$diagnosis)
```

    ## 
    ##   B   M 
    ## 357 212

want to figure out how many features are "mean" values

``` r
colnames(wisc.data)
```

    ##  [1] "radius_mean"             "texture_mean"           
    ##  [3] "perimeter_mean"          "area_mean"              
    ##  [5] "smoothness_mean"         "compactness_mean"       
    ##  [7] "concavity_mean"          "concave.points_mean"    
    ##  [9] "symmetry_mean"           "fractal_dimension_mean" 
    ## [11] "radius_se"               "texture_se"             
    ## [13] "perimeter_se"            "area_se"                
    ## [15] "smoothness_se"           "compactness_se"         
    ## [17] "concavity_se"            "concave.points_se"      
    ## [19] "symmetry_se"             "fractal_dimension_se"   
    ## [21] "radius_worst"            "texture_worst"          
    ## [23] "perimeter_worst"         "area_worst"             
    ## [25] "smoothness_worst"        "compactness_worst"      
    ## [27] "concavity_worst"         "concave.points_worst"   
    ## [29] "symmetry_worst"          "fractal_dimension_worst"

``` r
length(grep("mean", colnames(wisc.data) , ignore.case=TRUE,fixed=FALSE))
```

    ## [1] 10

``` r
inds<-grep("_mean",colnames(wisc.data)) #stores the positions of the means into a vector
colnames(wisc.data)[inds] #grabs the exact column names using the positions stored in inds
```

    ##  [1] "radius_mean"            "texture_mean"          
    ##  [3] "perimeter_mean"         "area_mean"             
    ##  [5] "smoothness_mean"        "compactness_mean"      
    ##  [7] "concavity_mean"         "concave.points_mean"   
    ##  [9] "symmetry_mean"          "fractal_dimension_mean"

Setup a separate new vector called diagnosis to be 1 if a diagnosis is malignant ("M") and 0 otherwise. Note that R coerces TRUE to 1 and FALSE to 0.

### Principal Component Analysis

check if we need to scale

``` r
round(apply(wisc.data,2,mean),2)
```

    ##             radius_mean            texture_mean          perimeter_mean 
    ##                   14.13                   19.29                   91.97 
    ##               area_mean         smoothness_mean        compactness_mean 
    ##                  654.89                    0.10                    0.10 
    ##          concavity_mean     concave.points_mean           symmetry_mean 
    ##                    0.09                    0.05                    0.18 
    ##  fractal_dimension_mean               radius_se              texture_se 
    ##                    0.06                    0.41                    1.22 
    ##            perimeter_se                 area_se           smoothness_se 
    ##                    2.87                   40.34                    0.01 
    ##          compactness_se            concavity_se       concave.points_se 
    ##                    0.03                    0.03                    0.01 
    ##             symmetry_se    fractal_dimension_se            radius_worst 
    ##                    0.02                    0.00                   16.27 
    ##           texture_worst         perimeter_worst              area_worst 
    ##                   25.68                  107.26                  880.58 
    ##        smoothness_worst       compactness_worst         concavity_worst 
    ##                    0.13                    0.25                    0.27 
    ##    concave.points_worst          symmetry_worst fractal_dimension_worst 
    ##                    0.11                    0.29                    0.08

``` r
#takes the input data and applies the function that you want.. will apply it over the columns (2) but if you want rows use 1.  difficult to read the output, so it might be useful to clean up the data by rounding the numbers
```

check standard deviation of every column

``` r
round(apply(wisc.data,2,sd),2)
```

    ##             radius_mean            texture_mean          perimeter_mean 
    ##                    3.52                    4.30                   24.30 
    ##               area_mean         smoothness_mean        compactness_mean 
    ##                  351.91                    0.01                    0.05 
    ##          concavity_mean     concave.points_mean           symmetry_mean 
    ##                    0.08                    0.04                    0.03 
    ##  fractal_dimension_mean               radius_se              texture_se 
    ##                    0.01                    0.28                    0.55 
    ##            perimeter_se                 area_se           smoothness_se 
    ##                    2.02                   45.49                    0.00 
    ##          compactness_se            concavity_se       concave.points_se 
    ##                    0.02                    0.03                    0.01 
    ##             symmetry_se    fractal_dimension_se            radius_worst 
    ##                    0.01                    0.00                    4.83 
    ##           texture_worst         perimeter_worst              area_worst 
    ##                    6.15                   33.60                  569.36 
    ##        smoothness_worst       compactness_worst         concavity_worst 
    ##                    0.02                    0.16                    0.21 
    ##    concave.points_worst          symmetry_worst fractal_dimension_worst 
    ##                    0.07                    0.06                    0.02

the standard deviations as well as means are very different, so the data set needs to be scaled

run the principal component analysis

``` r
wisc.pr<-prcomp(wisc.data,scale=TRUE)
summary(wisc.pr)
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

PC1 makes up about 44% of the data -- meaning that on one axis one can represent 44% of the data o.o o.o o.o hmm pc2 will account for about 19% of the data with just a 2d plot, we would account for about 63% of the data

time to plot the data and see how it looks

``` r
biplot(wisc.pr)
```

![](class09_files/figure-markdown_github/unnamed-chunk-14-1.png) very messy plot obtained

want to get a cleaner plot even though we are only plotting pc1 and pc2, we can say that it accounts for about 64% of all of the data in the set we also want to color the plot by diagnosis type

``` r
plot(wisc.pr$x[,1],wisc.pr$x[,2],xlab="PC1",ylab="PC2",col=wisc.df$diagnosis)
```

![](class09_files/figure-markdown_github/unnamed-chunk-15-1.png) the WIDER spread of the red points shows that there are more ways to be cancerous because it is more varied than the healthy group

plot the proportion of variance to get the scree plot

``` r
var<-wisc.pr$sdev^2
var
```

    ##  [1] 1.328161e+01 5.691355e+00 2.817949e+00 1.980640e+00 1.648731e+00
    ##  [6] 1.207357e+00 6.752201e-01 4.766171e-01 4.168948e-01 3.506935e-01
    ## [11] 2.939157e-01 2.611614e-01 2.413575e-01 1.570097e-01 9.413497e-02
    ## [16] 7.986280e-02 5.939904e-02 5.261878e-02 4.947759e-02 3.115940e-02
    ## [21] 2.997289e-02 2.743940e-02 2.434084e-02 1.805501e-02 1.548127e-02
    ## [26] 8.177640e-03 6.900464e-03 1.589338e-03 7.488031e-04 1.330448e-04

``` r
tvar<-sum(var)
tvar
```

    ## [1] 30

``` r
pvar<-100*var/tvar
pvar
```

    ##  [1] 4.427203e+01 1.897118e+01 9.393163e+00 6.602135e+00 5.495768e+00
    ##  [6] 4.024522e+00 2.250734e+00 1.588724e+00 1.389649e+00 1.168978e+00
    ## [11] 9.797190e-01 8.705379e-01 8.045250e-01 5.233657e-01 3.137832e-01
    ## [16] 2.662093e-01 1.979968e-01 1.753959e-01 1.649253e-01 1.038647e-01
    ## [21] 9.990965e-02 9.146468e-02 8.113613e-02 6.018336e-02 5.160424e-02
    ## [26] 2.725880e-02 2.300155e-02 5.297793e-03 2.496010e-03 4.434827e-04

``` r
barplot(pvar)
```

![](class09_files/figure-markdown_github/unnamed-chunk-16-1.png) looks like 3pc is where the elbow is

Alternative scree plot with **data driven y-axis**

``` r
barplot(pvar, ylab = "Precent of Variance Explained",
     names.arg=paste0("PC",1:length(pvar)), las=2, axes = FALSE)
axis(2, at=pvar, labels=round(pvar,2)*100 )
```

![](class09_files/figure-markdown_github/unnamed-chunk-17-1.png)

### hiearchical clustering

because hierarchical clustering does not assume the number of natural groups that exist in the data, the distance between all pairs of obesrvations must be computed

scale the data

``` r
data.scaled<-scale(wisc.data)
```

find the distances between all pairs

``` r
data.dist<-dist(data.scaled)
head(data.dist)
```

    ## [1] 10.309426  6.771675 10.463467  8.663413  8.402233  9.843286

hclust!

``` r
wisc.hclust<-hclust(data.dist, method=
                      "complete")
```

plot! Using the plot() and abline() functions, what is the height at which the clustering model has 4 clusters?

``` r
plot(wisc.hclust)
abline(h=19.5,col="red", lty=2)
```

![](class09_files/figure-markdown_github/unnamed-chunk-21-1.png)

what does he mean by target variable? is that the b/m readout

cut the dendrogram

``` r
wisc.hclust.clusters<-cutree(wisc.hclust,k=4)
```

Use table to compare the clusters to the diagnostics

``` r
diagnosis<- wisc.df$diagnosis=="M"
table(wisc.hclust.clusters, diagnosis)
```

    ##                     diagnosis
    ## wisc.hclust.clusters FALSE TRUE
    ##                    1    12  165
    ##                    2     2    5
    ##                    3   343   40
    ##                    4     0    2

cluster 1 largely corresponds to malignant cells while cluster 3 largely corresponds to benign cells

Can you find a better cluster vs diagnoses match with by cutting into a different number of clusters between 2 and 10? Explore how different numbers of clusters affect the ability of the hierarchical clustering to separate the different diagnoses

``` r
wisc.hclust5<-cutree(wisc.hclust,k=5)
table(wisc.hclust5, diagnosis)
```

    ##             diagnosis
    ## wisc.hclust5 FALSE TRUE
    ##            1    12  165
    ##            2     0    5
    ##            3   343   40
    ##            4     2    0
    ##            5     0    2

``` r
wisc.hclust6<-cutree(wisc.hclust,k=6)
table(wisc.hclust6, diagnosis)
```

    ##             diagnosis
    ## wisc.hclust6 FALSE TRUE
    ##            1    12  165
    ##            2     0    5
    ##            3   331   39
    ##            4     2    0
    ##            5    12    1
    ##            6     0    2

``` r
wisc.hclust7<-cutree(wisc.hclust,k=7)
table(wisc.hclust7, diagnosis)
```

    ##             diagnosis
    ## wisc.hclust7 FALSE TRUE
    ##            1    12  165
    ##            2     0    3
    ##            3   331   39
    ##            4     2    0
    ##            5    12    1
    ##            6     0    2
    ##            7     0    2

``` r
wisc.hclust8<-cutree(wisc.hclust,k=8)
table(wisc.hclust8, diagnosis)
```

    ##             diagnosis
    ## wisc.hclust8 FALSE TRUE
    ##            1    12   86
    ##            2     0   79
    ##            3     0    3
    ##            4   331   39
    ##            5     2    0
    ##            6    12    1
    ##            7     0    2
    ##            8     0    2

Up until clustering by 7, the numbers stay relatively the same. When you create 8 clusters, two prominent malignant groups emerge.

### k-means clustering

Take some time to see how each clustering model performs in terms of separating the two diagnoses and how the clustering models compare to each other.

``` r
wisc.km<-kmeans(data.scaled,centers=2,nstart=20)
table(wisc.km$cluster, diagnosis)
```

    ##    diagnosis
    ##     FALSE TRUE
    ##   1    14  175
    ##   2   343   37

have to make sure to call on cluster within wisc.km and not just utilize wisc.km

How well does k-means separate the two diagnoses? How does it compare to your hclust results? Overall, this method marked more as being cancerous than non cancerous. it had the same amount of non-malignant reads in one of the clusters though.

### combining methods

clustering on PCA results we need a distance matrix of our data -- will be clustering on only the data from the first two principle components we are processing a lot of data so we will use a new method known as using table will tell us how many points are in each group

``` r
d<-dist(wisc.pr$x[,1:2])
hcwc<-hclust(d,method="ward.D2")
plot(hcwc)
abline(40,0, col="red")
```

![](class09_files/figure-markdown_github/unnamed-chunk-26-1.png)

``` r
cutwc<-cutree(hcwc,h=40)
table(cutwc)
```

    ## cutwc
    ##   1   2   3 
    ## 112  83 374

after seperating the PCA data using hiearchical clustering, plot the new PCA plot with colors

``` r
plot(wisc.pr$x[,1:2], col=cutwc)
```

![](class09_files/figure-markdown_github/unnamed-chunk-27-1.png)

but we want to know how many are benign / malignant in each of those subgroups to see if there is a trend.. first we need to make the diagnostic data into a number vector, can do this with logicals because true is 1 and false is 0

``` r
diagnosis<- wisc.df$diagnosis=="M"
table(cutwc,wisc.df$diagnosis)
```

    ##      
    ## cutwc   B   M
    ##     1   0 112
    ##     2  18  65
    ##     3 339  35

``` r
table(cutwc,diagnosis)
```

    ##      diagnosis
    ## cutwc FALSE TRUE
    ##     1     0  112
    ##     2    18   65
    ##     3   339   35

3d plot - could notc complete.. could not upload rgl's dll

### sensitivity and specificity

### predict

we will use the predict function to take our PCA model from before and new cancer cell data and project that data onto our pca space

``` r
url <- "https://tinyurl.com/new-samples-CSV"
new <- read.csv(url)
npc <- predict(wisc.pr, newdata=new)
npc
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

now we want to plot the old pc plot with the new data

``` r
plot(wisc.pr$x[,1:2], col=cutwc)
points(npc[,1], npc[,2], col="blue", pch=16)
```

![](class09_files/figure-markdown_github/unnamed-chunk-30-1.png)

### optional: PCA of protein data structure
