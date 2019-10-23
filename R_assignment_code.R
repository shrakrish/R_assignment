---
title: "R_code"
output: html_document
---

```
```{r}
library(reshape2)
library(tidyr)
library(tidyverse)
library(dplyr)
library(stringr)
library(plyr)

#reading new files
snp <- read_tsv("./snp_position.txt")
View(snp)
fang_et_al <- read_tsv("./fang_et_al_genotypes.txt")
View(fang_et_al)
#to modify the SNP file
snp <- read.delim("~/Documents/Classes/BCB 546X/snp_positions.txt")
View(snp)
select(snp, SNP_ID, Chromosome, Position) -> snp_final
arrange(snp_final, Position) -> snp_sort
#making the maize and teosinte files
filter(fang_et_al, Group %in% c("ZMMIL", "ZMMLR", "ZMMMR")) -> maize
filter(fang_et_al, Group %in% c("ZMPBA", "ZMPIL", "ZMPJA")) -> teosinte
```
```
```

```{r}
#transposing the maize and teosinte files
t(maize) -> t_maize
t(teosinte) -> t_teosinte
#name the first nameless column on the transposed data as SNP_ID to match with the first column on the SNp file 
data.frame(SNP_ID=rownames(t_maize), t_maize, row.names=NULL, check.names=FALSE) -> maize_final
#same for teosinte
data.frame(SNP_ID=rownames(t_teosinte), t_teosinte, row.names=NULL, check.names=FALSE) -> teosinte_final
#merging
merge( snp_sort, maize_final, by="SNP_ID", all=TRUE) -> maize_snp
merge( snp_sort, teosinte_final, by="SNP_ID", all=TRUE) -> teosinte_snp
#for sorting into chromosomes using a loop
for(i in 1:10){
  temp <- filter(maize_snp, Chromosome == i)
  write.csv(temp, paste("maize_chr",i,".csv",sep=""),row.names=F)
}
#doing the same for teosinte data 
for(i in 1:10){
  temp <- filter(teosinte_snp, Chromosome == i)
  write.csv(temp2, paste("teosinte_chr",i,".csv",sep=""),row.names=F)
}
```

```
```

```{r}
#reading the teosinte and maize files that were saved and written into the local repository - this will change depending on your local folder - tried to modify this step but couldn't 

teosinte_chr10 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr10.csv")
teosinte_chr9 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr9.csv")
teosinte_chr8 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr8.csv") 
teosinte_chr7 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr7.csv")
teosinte_chr6 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr6.csv")
teosinte_chr5 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr5.csv")
teosinte_chr4 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr4.csv")
teosinte_chr3 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr3.csv")
teosinte_chr2 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr2.csv")
teosinte_chr1 <- read.csv("~/Documents/Classes/BCB 546X/teosinte_chr1.csv")

maize_chr1 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr1.csv")
maize_chr2 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr2.csv")
maize_chr3 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr3.csv")
maize_chr4 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr4.csv")
maize_chr5 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr5.csv")
maize_chr6 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr6.csv")
maize_chr7 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr7.csv")
maize_chr8 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr8.csv")
maize_chr9 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr9.csv")
maize_chr10 <- read.csv("~/Documents/Classes/BCB 546X/maize_chr10.csv")

#MAIZE
#arranging the chr files in increasing order 
#for some reason, my for loop and functions kept giving me errors so I stuck to this tedious way of doing it, kindly recommend how to fix this
temp <- arrange(maize_chr1, Position) 
write.csv(temp, paste("maize_inc_1",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr2, Position) 
write.csv(temp, paste("maize_inc_2",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr3, Position) 
write.csv(temp, paste("maize_inc_3",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr4, Position) 
write.csv(temp, paste("maize_inc_4",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr5, Position) 
write.csv(temp, paste("maize_inc_5",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr6, Position) 
write.csv(temp, paste("maize_inc_6",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr7, Position) 
write.csv(temp, paste("maize_inc_7",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr8, Position) 
write.csv(temp, paste("maize_inc_8",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr9, Position) 
write.csv(temp, paste("maize_inc_9",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr10, Position) 
write.csv(temp, paste("maize_inc_10",".csv",sep=""),row.names=F)


#arranging the chr files in decreasing order 
temp <- arrange(maize_chr1, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_1",".csv",sep=""),row.names=F)

temp <- arrange(maize_chr2, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_2",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr3, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_3",".csv",sep=""),row.names=F)

temp <- arrange(maize_chr4, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_4",".csv",sep=""),row.names=F)

temp <- arrange(maize_chr5, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_5",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr6, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_6",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr7, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_7",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr8, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_8",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr9, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_9",".csv",sep=""),row.names=F)
temp <- arrange(maize_chr10, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("maize_dec_10",".csv",sep=""),row.names=F)

#TEOSINTE
#Doing the same thing for TEOSINTE 
temp <- arrange(teosinte_chr1, Position) 
write.csv(temp, paste("teosinte_inc_1",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr2, Position) 
write.csv(temp, paste("teosinte_inc_2",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr3, Position) 
write.csv(temp, paste("teosinte_inc_3",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr4, Position) 
write.csv(temp, paste("teosinte_inc_4",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr5, Position) 
write.csv(temp, paste("teosinte_inc_5",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr6, Position) 
write.csv(temp, paste("teosinte_inc_6",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr7, Position) 
write.csv(temp, paste("teosinte_inc_7",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr8, Position) 
write.csv(temp, paste("teosinte_inc_8",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr9, Position) 
write.csv(temp, paste("teosinte_inc_9",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr10, Position) 
write.csv(temp, paste("teosinte_inc_10",".csv",sep=""),row.names=F)

#arranging the chr files in decreasing order AND replacing ? with -
temp <- arrange(teosinte_chr1, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_1",".csv",sep=""),row.names=F)

temp <- arrange(teosinte_chr2, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_2",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr3, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_3",".csv",sep=""),row.names=F)

temp <- arrange(teosinte_chr4, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_4",".csv",sep=""),row.names=F)

temp <- arrange(teosinte_chr5, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_5",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr6, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_6",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr7, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_7",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr8, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_8",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr9, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_9",".csv",sep=""),row.names=F)
temp <- arrange(teosinte_chr10, desc(Position)) 
temp1 <- data.frame(sapply(temp,function(x) {x <- gsub("?","-",x,fixed=TRUE)}))
write.csv(temp1, paste("teosinte_dec_10",".csv",sep=""),row.names=F)

```
```
```
```{r}
#GGPLOT

#transposing the fang file 
t(fang_et_al) -> t_fang
#naming the first nameless column in this file
data.frame(SNP_ID=rownames(t_fang), t_fang, row.names=NULL, check.names=FALSE) -> fang_final
#merging it with the modified SNP file(containing only the first three columns)
merge(snp_sort, fang_final, by="SNP_ID", all=TRUE) -> fang_snp
#ggplot to view the distribution of groups in the fang file
ggplot(fang_et_al, aes(Group)) + geom_bar()
# ZMMIL, ZMMLR and ZMPBA contribute to the most counts
#Melting data sets to make them tidy
headers_names <- colnames(fang_et_al)[-c(1:3)]
fang_melt <- melt(fang_et_al, measure.vars = headers_names)
#making homozygous subsets
ishomo <- (fang_melt$value=="A/A" | fang_melt$value=="C/C" | fang_melt$value=="G/G" | fang_melt$value=="T/T" )
#counting heterozygous
hetero <- (fang_melt$value!="A/A" | fang_melt$value!="C/C" | fang_melt$value!= "G/G" | fang_melt$value!= "T/T" )
#counting missing values
fang_melt[ fang_melt == "?/?"] -> missing

#sorting according to ID
arrange(fang_melt, Sample_ID) -> fang_ID_sort
#sorting acording to group
arrange(fang_melt, Group) -> fang_group_sort
#counting and grouping iin separate files
count_ID <- ddply(fang_ID_sort, c("Sample_ID"), summarise, count_homozygous=sum(ishomo, na.rm=TRUE), count_heterozygous=sum(!ishomo, na.rm=TRUE), missing=sum(is.na(ishomo)))
#melting 
count_ID_melt <- melt(count_ID, measure.vars = c("count_homozygous", "count_heterozygous", "missing"))
#plotting this
ggplot(count_ID_melt,aes(x = Sample_ID, y= value, fill=variable)) + geom_bar(stat = "identity", position ="stack")
#Doing this for grouped data
count_group <- ddply(fang_group_sort, c("Sample_ID"), summarise, count_homozygous=sum(ishomo, na.rm=TRUE), count_heterozygous=sum(!ishomo, na.rm=TRUE), isNA=sum(is.na(ishomo)))
#melting to make this pretty
count_group_melt <- melt(count_ID, measure.vars = c("count_homozygous", "count_heterozygous", "missing"))
#plotting a graph
ggplot(count_ID_melt,aes(x = Sample_ID, y= value, fill=variable)) + geom_bar(stat = "identity", position ="stack")
#plotting a graph to show the snps grouped by chromosome
ggplot(data = fang_snp) + geom_density(mapping=aes(x = Chromosome, fill = Chromosome), alpha = 0.15) + theme(axis.text.y = element_blank())
#SHowing SNp positions varying with chromosomes
ggplot(fang_snp,aes(x = Chromosome, y= Position)) + geom_bar(stat = "identity", color= "blue") + theme(axis.text.y = element_blank())

```
```









