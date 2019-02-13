Class 07 Function and packages
================
Ivy Fernandes
1/30/2019

Functions Revisited
-------------------

load (i.e. **source**) our rescale() function from last day

``` r
source("http://tinyurl.com/rescale-R")
```

Test this function

``` r
rescale(1:5)
```

    ## [1] 0.00 0.25 0.50 0.75 1.00

``` r
is.numeric(1:5)
```

    ## [1] TRUE

``` r
is.numeric("string")
```

    ## [1] FALSE

we see that the output is false if it is not numeric BUT we want to check if it is numeric. use the exclamation mark to ask for the inverse of the function

``` r
!is.numeric(1:5)
```

    ## [1] FALSE

``` r
!is.numeric("string")
```

    ## [1] TRUE

both\_na example
----------------

first we will start by solving a simple example where we know the answer

``` r
x<-c(1,2,NA,3,NA)
y<-c(NA,3,NA,3,4)
```

test the code from the internet

``` r
is.na(x)
```

    ## [1] FALSE FALSE  TRUE FALSE  TRUE

tells us where we have NA(true)

``` r
is.na(y)
```

    ## [1]  TRUE FALSE  TRUE FALSE FALSE

we want to know when both x and y have NA at the same place

``` r
is.na(x)&is.na(y)
```

    ## [1] FALSE FALSE  TRUE FALSE FALSE

now we want to know how many trues are in this last line we know that true has a value of 1 and false has a value of 0

``` r
sum(is.na(x)&is.na(y))
```

    ## [1] 1

what if we want to figure out where in the vector the element is true?

``` r
which(is.na(x)&is.na(y))
```

    ## [1] 3

now let's make the function!! take the working snippet and make a first function

``` r
both_na<- function(x,y){
  #check for NA elements in both input vectors
  sum(is.na(x)&is.na(y))
}
```

``` r
both_na(x,y)
```

    ## [1] 1

``` r
x <- c(NA, NA, NA)
y1 <- c( 1, NA, NA)
y2 <- c( 1, NA, NA, NA)
y3<-c(1,NA,NA,NA,NA)
```

``` r
both_na(x, y1)
```

    ## [1] 2
