#' ---
#' title: "BGGN 213 Class 05"
#' author: "Ivy Fernandes"
#' date: "January 25, 2019"
#' output: github_document
#' ---
#' Class 05 graphics and plots with R
#' 

## Class 05 graphics and plots with R

# Section 2a: line plot
weight<- read.table("bimm143_05_rstats/weight_chart.txt", header=TRUE)
plot(weight$Age,weight$Weight,type="b", 
     pch=15,
     cex=1.5,
     lwd=2,
     ylim=c(2,10),
     xlab= "Age (Months)",
     ylab="Weight (kg)",
     main="Weight Trends by Age")  
  #b results in both "l"ine and "p"oints 

# Section 2b: bar plot
feat<-read.table("bimm143_05_rstats/feature_counts.txt",header=TRUE,sep="\t")
  #importing this file was different than the first one, because there are 
  #inconsistensies in how many words there are for a single feature
  #use sep (field separator character) to encode a tab (\t) instead of a space
barplot(feat$Count, 
        width=2,
        names.arg=feat$Feature,
        las=2,
        horiz=TRUE,
        xlim=c(0, 90000),
        main="Numbers of Features in the Mouse GRCm38 Gene"
       )
  #height - needs to corelate to count
  #las helps to reorient the labels so that they all fit and are readable
  #reorient entire bar plot using the horiz argument 

par(mar=c(5,12,4,2))
  #want to set the margins so that we can read the entire feature name 
  #must recall the plot because it runs it sequentially
barplot(feat$Count,
        names.arg=feat$Feature,
        las=2,
        horiz=TRUE,
        xlim=c(0, 90000),
        main="Numbers of Features in the Mouse GRCm38 Gene"
)
 

# Section 3a: providing color vectors 
mf<-read.table("bimm143_05_rstats/male_female_counts.txt", header=TRUE,sep="\t")
mfc<- read.delim("bimm143_05_rstats/male_female_counts.txt") 
  #sets it to match a common file format so that you do not have to fill in the arguments
barplot(mf$Count,
        names.arg=mf$Sample,
        xlab= "Names",
        las=2,
        ylab="Count",
        col=rainbow(nrow(mf))
        )
  #different colors for males and females - only works out because the data is already sorted
  # male, female, male, female etc however if you wanted to specifically color males and females
  # to specific colors we would need to sort data differently
barplot(mf$Count,
        names.arg=mf$Sample,
        xlab= "Names",
        las=2,
        ylab="Count",
        col=c("pink","purple"))
#using new color schemes that are pre-loaded 
barplot(mf$Count,
        names.arg=mf$Sample,
        xlab= "Names",
        las=2,
        ylab="Count",
        col=topo.colors(nrow(mf)))
#using new color schemes that are from > install.packages("colorspace")
# barplot(mf$Count,
#         names.arg=mf$Sample,
#         xlab= "Names",
#         las=2,
#         ylab="Count",
#         col=sequential_hcl(nrow(mf)))

# Section 3b: coloring by value
genes<-read.delim("bimm143_05_rstats/up_down_expression.txt")
table(genes$State)
palette(c("blue","gray","red"))
plot(genes$Condition1,genes$Condition2, col=genes$State)
  # > palette()  <- this was used before setting the palette above to see what colors are default
  # [1] "black"   "red"     "green3"  "blue"    "cyan"    "magenta" "yellow"  "gray"   
  # > levels(genes$State)  <- this was used to see what colors coressponded to which state
  # [1] "down"       "unchanging" "up"  

# Section 3c: coloring by point density
meth<-read.delim("bimm143_05_rstats/expression_methylation.txt")
mycols=map.colors(meth$expression,c(max(meth$expression),min(meth$expression)),
colorRampPalette(c("grey","red"))(100))
plot(meth$promoter.meth,meth$gene.meth,
     ylab="Gene Methylation",
     xlab="Promoter Methylation",
     col=mycols)

