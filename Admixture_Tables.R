## Libraries necessary ##

library(readr)
library(plyr)
library(ggplot2)


## Import datasets ##

# h_ll_pv_0223 (PV) individual
PV_Table3 <- read_delim("~/Documents/Admixture/h_ll_pv_0223_Table3.txt", delim = '\t', col_names = TRUE)
CR_0205_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0205_Table3.txt", delim = '\t', col_names = TRUE)
CR_0206_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0206_Table3.txt", delim = '\t', col_names = TRUE)
CR_0207_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0207_Table3.txt", delim = '\t', col_names = TRUE)
CR_0208_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0208_Table3.txt", delim = '\t', col_names = TRUE)
CR_0209_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0209_Table3.txt", delim = '\t', col_names = TRUE)
CR_0212_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0212_Table3.txt", delim = '\t', col_names = TRUE)


## Boxplot ##

# Of h_ll_pv_0223 (PV) introgressed segments length #
  
# 1. convert Allele to factor: #
PV_Table3$Allele <- as.factor(PV_Table3$Allele)

# 2. Boxplot: #
pvlengthbox <- ggplot(PV_Table3, aes(x=Allele, y=Length, color=Allele)) + 
  scale_y_continuous(breaks=seq(0,700000,50000)) +
  geom_boxplot()
pvlengthbox

# Of c_ll_cr_0205 (CR) introgressed segments length #

# 1. convert Allele to factor: #
CR_0205_Table3$Allele <- as.factor(CR_0205_Table3$Allele)

# 2. Boxplot: #
cr_0205_lengthbox <- ggplot(CR_0205_Table3, aes(x=Allele, y=Length, color=Allele)) + 
  scale_y_continuous(breaks=seq(0,700000,50000)) +
  geom_boxplot()
cr_0205_lengthbox

