Class 13: Genome informatics and high throughput sequencing
================
Ivy Fernandes
2/22/2019

R Markdown
----------

``` r
data<-read.csv("373531-SampleGenotypes-Homo_sapiens_Variation_Sample_rs8067378.csv")
data
```

    ##    Sample..Male.Female.Unknown. Genotype..forward.strand. Population.s.
    ## 1                   NA19648 (F)                       A|A ALL, AMR, MXL
    ## 2                   NA19649 (M)                       G|G ALL, AMR, MXL
    ## 3                   NA19651 (F)                       A|A ALL, AMR, MXL
    ## 4                   NA19652 (M)                       G|G ALL, AMR, MXL
    ## 5                   NA19654 (F)                       G|G ALL, AMR, MXL
    ## 6                   NA19655 (M)                       A|G ALL, AMR, MXL
    ## 7                   NA19657 (F)                       A|G ALL, AMR, MXL
    ## 8                   NA19658 (M)                       A|A ALL, AMR, MXL
    ## 9                   NA19661 (M)                       A|G ALL, AMR, MXL
    ## 10                  NA19663 (F)                       A|A ALL, AMR, MXL
    ## 11                  NA19664 (M)                       G|A ALL, AMR, MXL
    ## 12                  NA19669 (F)                       A|A ALL, AMR, MXL
    ## 13                  NA19670 (M)                       A|A ALL, AMR, MXL
    ## 14                  NA19676 (M)                       G|G ALL, AMR, MXL
    ## 15                  NA19678 (F)                       A|A ALL, AMR, MXL
    ## 16                  NA19679 (M)                       A|G ALL, AMR, MXL
    ## 17                  NA19681 (F)                       A|G ALL, AMR, MXL
    ## 18                  NA19682 (M)                       A|G ALL, AMR, MXL
    ## 19                  NA19684 (F)                       A|G ALL, AMR, MXL
    ## 20                  NA19716 (F)                       G|A ALL, AMR, MXL
    ## 21                  NA19717 (M)                       A|G ALL, AMR, MXL
    ## 22                  NA19719 (F)                       G|G ALL, AMR, MXL
    ## 23                  NA19720 (M)                       G|G ALL, AMR, MXL
    ## 24                  NA19722 (F)                       G|A ALL, AMR, MXL
    ## 25                  NA19723 (M)                       G|G ALL, AMR, MXL
    ## 26                  NA19725 (F)                       A|G ALL, AMR, MXL
    ## 27                  NA19726 (M)                       A|A ALL, AMR, MXL
    ## 28                  NA19728 (F)                       A|A ALL, AMR, MXL
    ## 29                  NA19729 (M)                       A|G ALL, AMR, MXL
    ## 30                  NA19731 (F)                       A|A ALL, AMR, MXL
    ## 31                  NA19732 (M)                       A|G ALL, AMR, MXL
    ## 32                  NA19734 (F)                       G|A ALL, AMR, MXL
    ## 33                  NA19735 (M)                       G|G ALL, AMR, MXL
    ## 34                  NA19740 (F)                       A|A ALL, AMR, MXL
    ## 35                  NA19741 (M)                       A|A ALL, AMR, MXL
    ## 36                  NA19746 (F)                       A|A ALL, AMR, MXL
    ## 37                  NA19747 (M)                       G|A ALL, AMR, MXL
    ## 38                  NA19749 (F)                       A|G ALL, AMR, MXL
    ## 39                  NA19750 (M)                       A|G ALL, AMR, MXL
    ## 40                  NA19752 (F)                       A|G ALL, AMR, MXL
    ## 41                  NA19755 (F)                       A|A ALL, AMR, MXL
    ## 42                  NA19756 (M)                       G|A ALL, AMR, MXL
    ## 43                  NA19758 (F)                       A|G ALL, AMR, MXL
    ## 44                  NA19759 (M)                       G|A ALL, AMR, MXL
    ## 45                  NA19761 (F)                       G|A ALL, AMR, MXL
    ## 46                  NA19762 (M)                       A|A ALL, AMR, MXL
    ## 47                  NA19764 (F)                       A|A ALL, AMR, MXL
    ## 48                  NA19770 (F)                       A|G ALL, AMR, MXL
    ## 49                  NA19771 (M)                       A|A ALL, AMR, MXL
    ## 50                  NA19773 (F)                       A|A ALL, AMR, MXL
    ## 51                  NA19774 (M)                       A|G ALL, AMR, MXL
    ## 52                  NA19776 (F)                       A|G ALL, AMR, MXL
    ## 53                  NA19777 (M)                       A|A ALL, AMR, MXL
    ## 54                  NA19779 (F)                       G|A ALL, AMR, MXL
    ## 55                  NA19780 (M)                       A|A ALL, AMR, MXL
    ## 56                  NA19782 (F)                       G|A ALL, AMR, MXL
    ## 57                  NA19783 (M)                       A|G ALL, AMR, MXL
    ## 58                  NA19785 (F)                       A|A ALL, AMR, MXL
    ## 59                  NA19786 (M)                       G|A ALL, AMR, MXL
    ## 60                  NA19788 (F)                       A|G ALL, AMR, MXL
    ## 61                  NA19789 (M)                       G|G ALL, AMR, MXL
    ## 62                  NA19792 (M)                       A|A ALL, AMR, MXL
    ## 63                  NA19794 (F)                       G|A ALL, AMR, MXL
    ## 64                  NA19795 (M)                       A|G ALL, AMR, MXL
    ##    Father Mother
    ## 1       -      -
    ## 2       -      -
    ## 3       -      -
    ## 4       -      -
    ## 5       -      -
    ## 6       -      -
    ## 7       -      -
    ## 8       -      -
    ## 9       -      -
    ## 10      -      -
    ## 11      -      -
    ## 12      -      -
    ## 13      -      -
    ## 14      -      -
    ## 15      -      -
    ## 16      -      -
    ## 17      -      -
    ## 18      -      -
    ## 19      -      -
    ## 20      -      -
    ## 21      -      -
    ## 22      -      -
    ## 23      -      -
    ## 24      -      -
    ## 25      -      -
    ## 26      -      -
    ## 27      -      -
    ## 28      -      -
    ## 29      -      -
    ## 30      -      -
    ## 31      -      -
    ## 32      -      -
    ## 33      -      -
    ## 34      -      -
    ## 35      -      -
    ## 36      -      -
    ## 37      -      -
    ## 38      -      -
    ## 39      -      -
    ## 40      -      -
    ## 41      -      -
    ## 42      -      -
    ## 43      -      -
    ## 44      -      -
    ## 45      -      -
    ## 46      -      -
    ## 47      -      -
    ## 48      -      -
    ## 49      -      -
    ## 50      -      -
    ## 51      -      -
    ## 52      -      -
    ## 53      -      -
    ## 54      -      -
    ## 55      -      -
    ## 56      -      -
    ## 57      -      -
    ## 58      -      -
    ## 59      -      -
    ## 60      -      -
    ## 61      -      -
    ## 62      -      -
    ## 63      -      -
    ## 64      -      -

What proportion of the Mexican Ancestry in Los Angeles sample population (MXL) are homozygous for the asthma associated SNP (G|G)?

Want to look only at the second column and look for G|G

``` r
homozygous_test<-data[,2]=="G|G"
homozygous_test
```

    ##  [1] FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [12] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [23]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [34] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [45] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [56] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE

``` r
homozygous_count<-sum(homozygous_test)
homozygous_count
```

    ## [1] 9

other method

``` r
genotype<-data$Genotype..forward.strand.
table(genotype)
```

    ## genotype
    ## A|A A|G G|A G|G 
    ##  22  21  12   9

counts it out for you

percentage

``` r
9/nrow(data)*100
```

    ## [1] 14.0625

Initial RNA-Seq analysis
------------------------

Now, you want to understand whether the SNP will affect gene expression HG00109 Sample

``` r
library(seqinr) 
library(gtools)
chars<-s2c("DDDDCDEDCDDDDBBDDDCC@")
#s2c takes single string and makes each letter an individual vector
phred <-asc(chars)-33
phred
```

    ##  D  D  D  D  C  D  E  D  C  D  D  D  D  B  B  D  D  D  C  C  @ 
    ## 35 35 35 35 34 35 36 35 34 35 35 35 35 33 33 35 35 35 34 34 31

Population scale analysis
-------------------------

``` r
populationdata<-read.table("rs8067378_ENSG00000172057.6.txt")
head(populationdata)
```

    ##    sample geno      exp
    ## 1 HG00367  A/G 28.96038
    ## 2 NA20768  A/G 20.24449
    ## 3 HG00361  A/A 31.32628
    ## 4 HG00135  A/A 34.11169
    ## 5 NA18870  G/G 18.25141
    ## 6 NA11993  A/A 32.89721

``` r
table(populationdata$geno) # to find out how many g/g genotypes are
```

    ## 
    ## A/A A/G G/G 
    ## 108 233 121

want to know of the 121 samples, what the medium expression of a particular gene is must find out where the columns / rows are g/g

``` r
gg<-populationdata$geno== "G/G"
gg
```

    ##   [1] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
    ##  [12] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE
    ##  [23]  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
    ##  [34] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
    ##  [45] FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
    ##  [56]  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
    ##  [67] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE
    ##  [78] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
    ##  [89]  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [100] FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
    ## [111]  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE
    ## [122] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
    ## [133] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
    ## [144] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE
    ## [155] FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
    ## [166]  TRUE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE FALSE
    ## [177] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [188] FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE
    ## [199]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
    ## [210] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
    ## [221] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [232]  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE
    ## [243] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE
    ## [254]  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
    ## [265] FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
    ## [276] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE
    ## [287]  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE
    ## [298] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
    ## [309] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE
    ## [320] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [331] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
    ## [342] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
    ## [353] FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE
    ## [364]  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE
    ## [375]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE
    ## [386] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
    ## [397] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [408] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [419] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
    ## [430] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE
    ## [441] FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
    ## [452] FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE

``` r
match(populationdata$geno,"G/G")
```

    ##   [1] NA NA NA NA  1 NA NA NA  1 NA NA NA NA NA NA NA  1 NA NA  1 NA NA  1
    ##  [24] NA NA NA NA  1  1 NA  1  1 NA NA  1 NA NA NA NA NA  1 NA NA NA NA  1
    ##  [47]  1 NA  1  1 NA NA NA NA NA  1  1 NA NA NA  1 NA NA NA NA NA NA NA NA
    ##  [70] NA NA  1  1 NA NA NA  1 NA  1 NA NA NA NA NA  1 NA NA NA  1 NA NA  1
    ##  [93]  1 NA NA NA NA NA NA NA NA NA NA  1  1  1 NA NA  1  1  1 NA NA  1  1
    ## [116] NA  1  1  1 NA NA NA NA NA NA NA NA  1 NA NA NA  1 NA NA  1 NA NA NA
    ## [139] NA  1 NA NA  1 NA NA NA NA NA NA  1 NA NA  1 NA NA  1 NA NA  1 NA NA
    ## [162] NA  1 NA NA  1 NA NA NA  1  1  1 NA NA  1 NA NA  1 NA NA NA NA NA NA
    ## [185] NA NA NA NA NA  1 NA NA  1  1  1 NA NA NA  1 NA  1 NA NA NA NA NA  1
    ## [208] NA NA NA  1 NA NA NA NA NA NA  1 NA NA NA NA NA  1  1 NA NA NA NA NA
    ## [231] NA  1  1 NA NA NA NA NA  1 NA  1 NA NA NA NA NA  1 NA NA  1 NA NA  1
    ## [254]  1 NA NA NA NA  1 NA  1 NA NA NA NA NA  1  1 NA NA  1  1 NA NA NA NA
    ## [277] NA NA NA  1 NA NA  1 NA  1 NA  1  1 NA NA NA  1  1 NA NA NA NA NA  1
    ## [300] NA NA NA NA NA NA NA  1  1 NA NA NA NA NA  1 NA  1 NA NA  1 NA NA NA
    ## [323] NA NA NA NA NA NA NA  1 NA NA NA NA NA NA NA NA NA  1 NA NA NA  1 NA
    ## [346] NA NA NA NA NA  1 NA NA NA  1  1  1 NA NA NA  1  1 NA  1 NA NA NA NA
    ## [369]  1 NA NA NA  1 NA  1  1 NA  1  1  1  1 NA  1 NA  1 NA NA NA NA NA  1
    ## [392] NA  1 NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA NA
    ## [415] NA NA NA NA NA NA  1 NA NA NA NA NA NA  1 NA NA NA NA NA NA  1  1 NA
    ## [438] NA NA NA NA NA NA NA NA  1 NA NA NA NA NA NA NA  1 NA NA  1  1 NA NA
    ## [461] NA NA

use the logical indeces to get the expression

``` r
exp_gg<-populationdata[gg, "exp"]
exp_gg
```

    ##   [1] 18.25141 17.67473 18.55622 23.10383 30.94554 21.14387 18.39547
    ##   [8] 12.02809 17.44761 29.82254 23.01983 13.42470 22.65437 11.07445
    ##  [15] 28.35841 28.79371 27.08956 16.11138 26.61928 30.18323 19.40790
    ##  [22] 19.52301 26.56808 17.34076 10.74263 16.66051 29.01720 20.69333
    ##  [29] 21.15677 18.58691 19.04962 22.81974 32.01142 21.12823 18.61268
    ##  [36] 19.37093 31.42162 16.67764 19.08659 21.55001  8.29591 12.58869
    ##  [43] 17.34109 28.23642 19.99979 25.55413 24.45672 23.53572 22.48273
    ##  [50] 14.66862 33.95602 18.26466 16.06661 17.32504 19.14766 12.57599
    ##  [57] 22.28749 17.29261 24.18141 16.07627 14.80495 23.46573 28.97074
    ##  [64] 27.78837 23.92355  9.55902 12.35836 22.53910 21.98118 16.40569
    ##  [71] 25.21931 24.32857 19.42882 26.56993 13.34557 16.60507 24.85165
    ##  [78] 21.56943 23.95528 16.18962 22.53720 26.04123  6.67482 20.07363
    ##  [85] 19.76527 18.50772 20.14146 18.07151  6.94390 22.14277 14.23742
    ##  [92] 19.85388 27.73467 19.02064 14.49816 26.78940 20.84709 10.77316
    ##  [99] 12.82128 16.90256 29.60045 14.81945 17.46326 23.26922 21.39806
    ## [106] 18.06320 15.91528 24.80823 26.04514 18.28089 23.24907 17.91118
    ## [113] 21.09502 24.74366 27.40521 24.85772 23.08482 16.56929 16.69044
    ## [120] 25.08880 32.78519

``` r
summary(exp_gg)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   6.675  16.903  20.074  20.594  24.457  33.956

what about for aa?

``` r
aa<-populationdata$geno== "A/A"
aa
```

    ##   [1] FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
    ##  [12] FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
    ##  [23] FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE
    ##  [34] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [45] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
    ##  [56] FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
    ##  [67]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE
    ##  [78] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
    ##  [89] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE
    ## [100] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [111] FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [122]  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
    ## [133]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [144] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [155]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
    ## [166] FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
    ## [177]  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE
    ## [188]  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [199] FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE
    ## [210] FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE
    ## [221] FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
    ## [232] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE
    ## [243]  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE
    ## [254] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE
    ## [265]  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE
    ## [276] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [287] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [298]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE
    ## [309] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [320] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [331] FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE
    ## [342] FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE
    ## [353] FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE
    ## [364] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE
    ## [375] FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE
    ## [386]  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [397] FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE FALSE
    ## [408]  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [419] FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE FALSE
    ## [430] FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [441] FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
    ## [452] FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE

``` r
exp_aa<-populationdata[aa, "exp"]
exp_aa
```

    ##   [1] 31.32628 34.11169 32.89721 47.64556 30.71355 25.44983 34.24915
    ##   [8] 35.15014 24.54684 49.39612 28.20755 28.56199 51.51787 38.10956
    ##  [15] 31.13741 39.12999 32.44173 34.03260 36.27151 26.10355 19.48106
    ##  [22] 38.77623 40.82922 46.50527 33.07320 25.47283 29.50655 27.48438
    ##  [29] 35.69719 32.42236 28.91526 19.14544 22.85572 31.17067 27.87464
    ##  [36] 27.91580 16.86780 23.66127 28.03403 36.51922 27.43637 35.63983
    ##  [43] 38.85161 22.44576 37.06379 35.67637 50.16704 37.94544 29.15536
    ##  [50] 28.85309 38.57101 30.89365 39.31537 31.43743 35.26739 22.37043
    ##  [57] 28.46943 30.15636 35.88457 32.59723 36.02549 23.86454 28.38114
    ##  [64] 25.14243 51.30170 28.14811 29.18390 27.09760 33.89656 33.48253
    ##  [71] 15.43178 29.45277 26.80283 43.51943 45.80808 26.55972 24.87330
    ##  [78] 29.99549 26.68589 39.37193 38.39523 41.23635 27.13936 36.55643
    ##  [85] 28.34688 15.42908 47.50579 30.15754 34.88439 29.29955 32.87767
    ##  [92] 43.43665 26.56050 21.87746 33.42582 25.38406 18.20442 21.62336
    ##  [99] 35.80093 32.26844 34.40756 23.99631 11.39643 35.24632 23.38376
    ## [106] 34.94395 31.92036 44.27738

``` r
summary(exp_aa)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   11.40   27.02   31.25   31.82   35.92   51.52

what about for ag?

``` r
ag<-populationdata$geno== "A/G"
ag
```

    ##   [1]  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE
    ##  [12]  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE
    ##  [23] FALSE FALSE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ##  [34]  TRUE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
    ##  [45]  TRUE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE
    ##  [56] FALSE FALSE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ##  [67] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE
    ##  [78]  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE
    ##  [89] FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE
    ## [100]  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE FALSE
    ## [111] FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE  TRUE FALSE
    ## [122] FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE
    ## [133] FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
    ## [144]  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE
    ## [155] FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE
    ## [166] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
    ## [177] FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE
    ## [188] FALSE  TRUE FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE  TRUE FALSE
    ## [199] FALSE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE
    ## [210]  TRUE FALSE  TRUE  TRUE FALSE FALSE  TRUE FALSE FALSE  TRUE  TRUE
    ## [221]  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
    ## [232] FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE
    ## [243] FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE FALSE
    ## [254] FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE FALSE FALSE
    ## [265] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE  TRUE FALSE
    ## [276]  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE
    ## [287] FALSE FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ## [298] FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE FALSE
    ## [309]  TRUE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE
    ## [320]  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE
    ## [331]  TRUE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE FALSE
    ## [342]  TRUE FALSE FALSE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE  TRUE
    ## [353]  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE
    ## [364] FALSE  TRUE  TRUE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE
    ## [375] FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
    ## [386] FALSE  TRUE  TRUE FALSE FALSE FALSE  TRUE FALSE  TRUE  TRUE  TRUE
    ## [397]  TRUE  TRUE  TRUE FALSE FALSE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE
    ## [408] FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE
    ## [419]  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE FALSE  TRUE
    ## [430]  TRUE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE
    ## [441]  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE  TRUE  TRUE FALSE
    ## [452]  TRUE  TRUE FALSE  TRUE FALSE FALSE FALSE FALSE  TRUE FALSE  TRUE

``` r
exp_ag<-populationdata[ag, "exp"]
exp_ag
```

    ##   [1] 28.96038 20.24449 31.48736 33.85374 16.29854 19.73450 13.96175
    ##   [8] 18.40351 34.21985 23.32404 23.18606 18.15997 28.03580 30.65270
    ##  [15] 20.51327 29.72309 22.50789 31.68959 28.76435 35.85543 37.62403
    ##  [22] 20.54885 31.04941 18.94583 32.29483 27.81775 19.89903 48.03410
    ##  [29] 27.90313 36.47949 20.03116 29.65063 34.92257 16.71385 16.68151
    ##  [36] 25.71008 11.60808 19.30953 20.49040 22.37224 15.20045 20.07459
    ##  [43] 35.42982 19.10884 24.81087 33.22193 33.40835 22.38996 31.31626
    ##  [50]  9.36055 23.17937 30.63079 19.10420 25.70962 38.34531 19.03976
    ##  [57] 28.81770 42.75662 25.61662 26.48467 28.02486 24.23377 21.03717
    ##  [64] 33.51752 20.73493 33.55650 36.62034 40.06318 33.92744 21.02084
    ##  [71] 29.95687 25.80393 21.49924 34.79575 34.57705 30.03549 16.59638
    ##  [78] 27.22300 24.35621 22.86793 23.19511 33.74015 24.08401 26.39419
    ##  [85] 32.33359 11.36287 21.16515 17.21277 22.73049 25.57669 11.97590
    ##  [92] 25.35846 33.32411 22.09122 25.19977 30.83577 23.63709 19.66773
    ##  [99] 24.64870 17.03159 22.27101 15.92557 32.54150 22.40203 27.41638
    ## [106] 31.99645 30.05415 20.01602 34.47373 28.75978 29.91249 15.71646
    ## [113] 21.76610  9.62656 28.53965 29.49417 29.55520 19.44178 21.43751
    ## [120] 30.40382 28.50982 21.48847 31.10134 35.99067 26.42877 26.28329
    ## [127] 20.72639 21.09140 23.79292 18.79569 29.54042 18.78700 21.41071
    ## [134] 21.29782 33.91853 27.20808 17.14895 28.72738 37.73840 34.14567
    ## [141] 15.36874 29.50350 25.70400 20.07219 24.53928 17.84487 23.35766
    ## [148] 15.71243 19.89034 25.37234 16.12745 24.18529 21.97051 13.08172
    ## [155] 32.00764 30.59653 29.74443 27.88354 11.12451  7.07505 23.13726
    ## [162] 21.09331  8.20002 20.62572 18.24345 11.13478 24.43943 22.24289
    ## [169] 24.67325 41.03924 33.31795 27.98844 31.57994 36.73337 18.45322
    ## [176] 23.60431 24.33489 35.74662 22.75684 34.42403 25.34866 25.06486
    ## [183] 36.78028 30.67131 37.82860 25.44086 29.49548 23.27255 28.69506
    ## [190] 26.52036 27.49975 24.66196 25.81562 22.49429 26.88264 28.98200
    ## [197] 34.31875 26.40231 21.67621 27.56805 16.16277 18.28963 30.55183
    ## [204] 20.70871 17.66476 22.79543 24.03419 18.02351 21.63102 27.54976
    ## [211] 14.79717 25.34921 21.34916 21.20080 28.36006 22.43773 25.56306
    ## [218] 19.50634 28.93651 31.79897 30.80067 33.95134 39.43243 23.91465
    ## [225] 20.97560 20.02507 33.44170 17.32813 32.61856 36.77906 16.84776
    ## [232] 31.53069 23.18250

``` r
summary(exp_ag)
```

    ##    Min. 1st Qu.  Median    Mean 3rd Qu.    Max. 
    ##   7.075  20.626  25.065  25.397  30.552  48.034

Generate a boxplot with a box per genotype, what could you infer from the relative expression value between A/A and G/G displayed in this plot? Does the SNP effect the expression of ORMDL3?

``` r
boxplot(exp ~ geno, data=populationdata, notch=TRUE)
```

![](class13_files/figure-markdown_github/unnamed-chunk-13-1.png)
