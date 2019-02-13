Class 06
================
Ivy Fernandes
January 25, 2019

File Reading Again
------------------

here we try to use \*\* read.table()\*\* and friends

utilizing the insert button to insert code chunks -- going to insert {r} code can put a url into the read.table function

``` r
read.table("https://bioboot.github.io/bggn213_S18/class-material/test1.txt", header=TRUE, sep=",")
```

    ##   Col1 Col2 Col3
    ## 1    1    2    3
    ## 2    4    5    6
    ## 3    7    8    9
    ## 4    a    b    c

shortcut to get a new code chunk is ctrl+alt+i

``` r
file1<-"https://bioboot.github.io/bggn213_S18/class-material/test1.txt"
read.csv(file1)
```

    ##   Col1 Col2 Col3
    ## 1    1    2    3
    ## 2    4    5    6
    ## 3    7    8    9
    ## 4    a    b    c

``` r
file2<-"https://bioboot.github.io/bggn213_S18/class-material/test2.txt"
read.table(file2, header=TRUE,sep='$')
```

    ##   Col1 Col2 Col3
    ## 1    1    2    3
    ## 2    4    5    6
    ## 3    7    8    9
    ## 4    a    b    c

``` r
file3<-"https://bioboot.github.io/bggn213_S18/class-material/test3.txt"
data3=read.table(file3)
data3
```

    ##   V1 V2 V3
    ## 1  1  6  a
    ## 2  2  7  b
    ## 3  3  8  c
    ## 4  4  9  d
    ## 5  5 10  e

Now we will start working with functions
----------------------------------------

Creating the first function

``` r
add<-function(x,y=1){
  #sum x and y
  x+y
}
```

time to use the **add()** function

``` r
add(1)
```

    ## [1] 2

``` r
add(1,5) # will replace the y=1 with 5 because you have included an argument
```

    ## [1] 6

``` r
add(c(1,2,3,4)) #will add 1 to all of these numbers within the vector
```

    ## [1] 2 3 4 5

``` r
add(c(1,2,3,4),4)
```

    ## [1] 5 6 7 8

``` r
# add(1,2,2) will not work because there are too many arguments
# add(x=1,y="b") will not work because there is a non-numeric value
```

Create a second function

``` r
rescale<-function(x){
rng<-range(x)
(x-rng[1]/(rng[2]-rng[1]))
}
```

testing the second function

``` r
rescale(1:10)
```

    ##  [1] 0.8888889 1.8888889 2.8888889 3.8888889 4.8888889 5.8888889 6.8888889
    ##  [8] 7.8888889 8.8888889 9.8888889

``` r
rescale(5:10)
```

    ## [1] 4 5 6 7 8 9

``` r
rescale(11:15)
```

    ## [1]  8.25  9.25 10.25 11.25 12.25

Test the function until it fails

``` r
rescale(c(1,2,NA,3,10)) #missing data point, what WOULD you want your function to do if you have data missing?
```

    ## [1] NA NA NA NA NA

Testing the function to determine the errors

``` r
range(c(1,2,NA,3,10))
```

    ## [1] NA NA

Look at range function to figure out if we can work around giving NA and working with functions that do exist Identified argument within function that ignores missing values na.rm=FALSE should be changed to TRUE Edit original function so that it will work

``` r
rescale2<-function(x){
rng<-range(x,na.rm=TRUE)
(x-rng[1]/(rng[2]-rng[1]))
}
```

Test editted functions

``` r
rescale2(c(1,2,NA,3,10))
```

    ## [1] 0.8888889 1.8888889        NA 2.8888889 9.8888889

Trying to use non-numeric will result in an error

``` r
# rescale(c(1,2,NA,3,10,"bggn213")) can potentially incorporate warnings that there are non-numerics 
```

How to print lines out in code-- use PRINT FUNCTION

``` r
rescale3 <- function(x, na.rm=TRUE, plot=FALSE) {
 if(na.rm) {
 rng <-range(x, na.rm=na.rm)
 } else {
 rng <-range(x)
 }
 print("Hello")
 answer <- (x - rng[1]) / (rng[2] - rng[1])
 print("is it me you are looking for?")
 if(plot) {
 plot(answer, typ="b", lwd=4)
   print("please don't ever sing again") # how come if plot=TRUE does it decide not to print this, why doesn't it do both
 }
 print("I can see it in ...")
}
```

``` r
rescale3(1:10)
```

    ## [1] "Hello"
    ## [1] "is it me you are looking for?"
    ## [1] "I can see it in ..."

``` r
rescale3(1:10,plot=TRUE)
```

    ## [1] "Hello"
    ## [1] "is it me you are looking for?"

![](class06_files/figure-markdown_github/unnamed-chunk-15-1.png)

    ## [1] "please don't ever sing again"
    ## [1] "I can see it in ..."

``` r
# rescale(1:10,plot=FALSE)
```

Hands-on Worksheet
==================

Using the bio3d package

``` r
library(bio3d)
```

``` r
pdb<- read.pdb("1hbs") #accession code 
```

    ##   Note: Accessing on-line PDB file

``` r
pdb
```

    ## 
    ##  Call:  read.pdb(file = "1hbs")
    ## 
    ##    Total Models#: 1
    ##      Total Atoms#: 9104,  XYZs#: 27312  Chains#: 8  (values: A B C D E F G H)
    ## 
    ##      Protein Atoms#: 8760  (residues/Calpha atoms#: 1148)
    ##      Nucleic acid Atoms#: 0  (residues/phosphate atoms#: 0)
    ## 
    ##      Non-protein/nucleic Atoms#: 344  (residues: 8)
    ##      Non-protein/nucleic resid values: [ HEM (8) ]
    ## 
    ##    Protein sequence:
    ##       VLSPADKTNVKAAWGKVGAHAGEYGAEALERMFLSFPTTKTYFPHFDLSHGSAQVKGHGK
    ##       KVADALTNAVAHVDDMPNALSALSDLHAHKLRVDPVNFKLLSHCLLVTLAAHLPAEFTPA
    ##       VHASLDKFLASVSTVLTSKYRVHLTPVEKSAVTALWGKVNVDEVGGEALGRLLVVYPWTQ
    ##       RFFESFGDLSTPDAVMGNPKVKAHGKKVLGAFSDGLAHLDNLKGT...<cut>...HKYH
    ## 
    ## + attr: atom, xyz, seqres, helix, calpha,
    ##         remark, call

copy paste code from document

``` r
library(bio3d)
s1 <- read.pdb("4AKE") # kinase with drug
```

    ##   Note: Accessing on-line PDB file

``` r
s2 <- read.pdb("1AKE") # kinase no drug
```

    ##   Note: Accessing on-line PDB file
    ##    PDB has ALT records, taking A only, rm.alt=TRUE

``` r
s3 <- read.pdb("1E4Y") # kinase with drug
```

    ##   Note: Accessing on-line PDB file

``` r
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s1, chain="A", elety="CA")
s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b
plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
```

![](class06_files/figure-markdown_github/unnamed-chunk-20-1.png)

``` r
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor")
```

![](class06_files/figure-markdown_github/unnamed-chunk-20-2.png)

``` r
plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")
```

![](class06_files/figure-markdown_github/unnamed-chunk-20-3.png)

first and third plots are the same -- looking at the code, the inputs are wrong and s1 is used twice

``` r
library(bio3d)
s1 <- read.pdb("4AKE") # kinase with drug
```

    ##   Note: Accessing on-line PDB file

    ## Warning in get.pdb(file, path = tempdir(), verbose = FALSE): /var/folders/
    ## 17/rtw23w_j0ljdwfldhftnrrjw0000gn/T//RtmpyoJC1p/4AKE.pdb exists. Skipping
    ## download

``` r
s2 <- read.pdb("1AKE") # kinase no drug
```

    ##   Note: Accessing on-line PDB file

    ## Warning in get.pdb(file, path = tempdir(), verbose = FALSE): /var/folders/
    ## 17/rtw23w_j0ljdwfldhftnrrjw0000gn/T//RtmpyoJC1p/1AKE.pdb exists. Skipping
    ## download

    ##    PDB has ALT records, taking A only, rm.alt=TRUE

``` r
s3 <- read.pdb("1E4Y") # kinase with drug
```

    ##   Note: Accessing on-line PDB file

    ## Warning in get.pdb(file, path = tempdir(), verbose = FALSE): /var/folders/
    ## 17/rtw23w_j0ljdwfldhftnrrjw0000gn/T//RtmpyoJC1p/1E4Y.pdb exists. Skipping
    ## download

``` r
s1.chainA <- trim.pdb(s1, chain="A", elety="CA")
s2.chainA <- trim.pdb(s2, chain="A", elety="CA")
s3.chainA <- trim.pdb(s3, chain="A", elety="CA")
s1.b <- s1.chainA$atom$b
s2.b <- s2.chainA$atom$b
s3.b <- s3.chainA$atom$b
plotb3(s1.b, sse=s1.chainA, typ="l", ylab="Bfactor")
```

![](class06_files/figure-markdown_github/unnamed-chunk-21-1.png)

``` r
plotb3(s2.b, sse=s2.chainA, typ="l", ylab="Bfactor")
```

![](class06_files/figure-markdown_github/unnamed-chunk-21-2.png)

``` r
plotb3(s3.b, sse=s3.chainA, typ="l", ylab="Bfactor")
```

![](class06_files/figure-markdown_github/unnamed-chunk-21-3.png)
