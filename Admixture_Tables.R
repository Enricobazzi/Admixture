####################################
##### Load necessary Libraries #####
####################################

library(readr)
library(plyr)
library(ggplot2)
library(devtools)
library(easyGgplot2)
library(dplyr)
library(tidyr)

###########################
##### Import datasets #####
###########################

PV_Table1 <- read_delim("~/Documents/Admixture/h_ll_pv_0223_Table1.txt", delim = '\t', col_names = TRUE)
PV_Table2 <- read_delim("~/Documents/Admixture/h_ll_pv_0223_Table2.txt", delim = '\t', col_names = TRUE) # HEADER ADDED BY HAND
PV_Table2$Length <- (PV_Table2$End - PV_Table2$Start)
PV_Table3 <- read_delim("~/Documents/Admixture/h_ll_pv_0223_Table3.txt", delim = '\t', col_names = TRUE)

CR_0205_Table1 <- read_delim("~/Documents/Admixture/c_ll_cr_0205_Table1.txt", delim = '\t', col_names = TRUE)
CR_0205_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0205_Table3.txt", delim = '\t', col_names = TRUE)
CR_0206_Table1 <- read_delim("~/Documents/Admixture/c_ll_cr_0206_Table1.txt", delim = '\t', col_names = TRUE)
CR_0206_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0206_Table3.txt", delim = '\t', col_names = TRUE)
CR_0207_Table1 <- read_delim("~/Documents/Admixture/c_ll_cr_0207_Table1.txt", delim = '\t', col_names = TRUE)
CR_0207_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0207_Table3.txt", delim = '\t', col_names = TRUE)
CR_0208_Table1 <- read_delim("~/Documents/Admixture/c_ll_cr_0208_Table1.txt", delim = '\t', col_names = TRUE)
CR_0208_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0208_Table3.txt", delim = '\t', col_names = TRUE)
CR_0209_Table1 <- read_delim("~/Documents/Admixture/c_ll_cr_0209_Table1.txt", delim = '\t', col_names = TRUE)
CR_0209_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0209_Table3.txt", delim = '\t', col_names = TRUE)
CR_0212_Table1 <- read_delim("~/Documents/Admixture/c_ll_cr_0212_Table1.txt", delim = '\t', col_names = TRUE)
CR_0212_Table3 <- read_delim("~/Documents/Admixture/c_ll_cr_0212_Table3.txt", delim = '\t', col_names = TRUE)

KI_0090_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0090_Table1.txt", delim = '\t', col_names = TRUE)
KI_0090_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0090_Table3.txt", delim = '\t', col_names = TRUE)
KI_0091_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0091_Table1.txt", delim = '\t', col_names = TRUE)
KI_0091_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0091_Table3.txt", delim = '\t', col_names = TRUE)
KI_0092_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0092_Table1.txt", delim = '\t', col_names = TRUE)
KI_0092_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0092_Table3.txt", delim = '\t', col_names = TRUE)
KI_0093_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0093_Table1.txt", delim = '\t', col_names = TRUE)
KI_0093_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0093_Table3.txt", delim = '\t', col_names = TRUE)
KI_0094_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0094_Table1.txt", delim = '\t', col_names = TRUE)
KI_0094_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0094_Table3.txt", delim = '\t', col_names = TRUE)
KI_0095_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0095_Table1.txt", delim = '\t', col_names = TRUE)
KI_0095_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0095_Table3.txt", delim = '\t', col_names = TRUE)
KI_0096_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0096_Table1.txt", delim = '\t', col_names = TRUE)
KI_0096_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0096_Table3.txt", delim = '\t', col_names = TRUE)
KI_0097_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0097_Table1.txt", delim = '\t', col_names = TRUE)
KI_0097_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0097_Table3.txt", delim = '\t', col_names = TRUE)
KI_0098_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0098_Table1.txt", delim = '\t', col_names = TRUE)
KI_0098_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0098_Table3.txt", delim = '\t', col_names = TRUE)
KI_0099_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0099_Table1.txt", delim = '\t', col_names = TRUE)
KI_0099_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0099_Table3.txt", delim = '\t', col_names = TRUE)
KI_0100_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0100_Table1.txt", delim = '\t', col_names = TRUE)
KI_0100_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0100_Table3.txt", delim = '\t', col_names = TRUE)
KI_0101_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0101_Table1.txt", delim = '\t', col_names = TRUE)
KI_0101_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0101_Table3.txt", delim = '\t', col_names = TRUE)
KI_0102_Table1 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0102_Table1.txt", delim = '\t', col_names = TRUE)
KI_0102_Table3 <- read_delim("~/Documents/Admixture/PCAdmix_Kirov/c_ll_ki_0102_Table3.txt", delim = '\t', col_names = TRUE)

All_Table1 <- rbind(PV_Table1, CR_0205_Table1, CR_0206_Table1, CR_0207_Table1, CR_0208_Table1, CR_0209_Table1, CR_0212_Table1, KI_0090_Table1, KI_0091_Table1, KI_0092_Table1, KI_0093_Table1, KI_0094_Table1, KI_0095_Table1, KI_0096_Table1, KI_0097_Table1, KI_0098_Table1, KI_0099_Table1, KI_0100_Table1, KI_0101_Table1, KI_0102_Table1, make.row.names = FALSE)
All_Table3 <- rbind(PV_Table3, CR_0205_Table3, CR_0206_Table3, CR_0207_Table3, CR_0208_Table3, CR_0209_Table3, CR_0212_Table3,  KI_0090_Table3, KI_0091_Table3, KI_0092_Table3, KI_0093_Table3, KI_0094_Table3, KI_0095_Table3, KI_0096_Table3, KI_0097_Table3, KI_0098_Table3, KI_0099_Table3, KI_0100_Table3, KI_0101_Table3, KI_0102_Table3, make.row.names = FALSE)


# For Vertical Table 1 with % of introgression for A and B alleles
Compact_Table1 <- All_Table1
colnames(Compact_Table1)[colnames(Compact_Table1)=="A_PCA_INTRO"] <- "A" 
colnames(Compact_Table1)[colnames(Compact_Table1)=="B_PCA_INTRO"] <- "B"
AB_separated_Table1 <- Compact_Table1 %>% gather(A, B, -INDIVIDUAL, -SCAFFOLD, -START, -END, -LENGTH, -TOT_WIN, -A_LP_WIN, -B_LP_WIN, -A_WPROP_INTRO, -B_WPROP_INTRO)
colnames(AB_separated_Table1)[colnames(AB_separated_Table1)=="A"] <- "PCA_ALLELE"
colnames(AB_separated_Table1)[colnames(AB_separated_Table1)=="B"] <- "PCA_INTRO"

#######################################################################
##### Of Concatenation of all tables introgressed segments length #####
#######################################################################

# 1. convert Allele to factor: #
All_Table3$Allele <- as.factor(All_Table3$Allele)
# 2. convert Individual to factor: #
All_Table3$Individual <- as.factor(All_Table3$Individual)

# 2. Boxplot: #
All_lengthbox <- ggplot(All_Table3, aes(x=Individual, y=Length, color=Allele)) + 
  scale_y_continuous(breaks=seq(0,700000,50000)) +
  geom_boxplot()
All_lengthbox

All_Table1$INDIVIDUAL <- as.factor(All_Table1$INDIVIDUAL)

All_percentbox <- ggplot(All_Table1, aes(x=INDIVIDUAL, y=A_PCA_INTRO, color=INDIVIDUAL)) + 
  scale_y_continuous(breaks=seq(0,1,0.02)) +
  geom_boxplot()
All_percentbox

#v1
ABsep_percentbox <- ggplot(AB_separated_Table1, aes(x=INDIVIDUAL, y=PCA_INTRO, color=INDIVIDUAL, fill=PCA_ALLELE)) + 
  scale_y_continuous(breaks=seq(0,1,0.02)) +
  scale_fill_manual(values = c("white", "white")) +
  geom_boxplot()
ABsep_percentbox

#v2
ABsep_percentbox <- ggplot(AB_separated_Table1, aes(x=INDIVIDUAL, y=PCA_INTRO, color=INDIVIDUAL)) + 
  scale_y_continuous(breaks=seq(0,1,0.02)) +
  geom_boxplot()
ABsep_percentbox

####################################################################
##### WHOLE dataset comparison of introgressed segment lengths #####
####################################################################

# 1.Faceting all in one graph
ggplot2.histogram(data=All_Table3, xName = 'Length', groupName = 'Individual', faceting=TRUE, facetingVarNames="Individual", addMeanLine=TRUE, binwidth = 5000) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

##### Overlapping PV with others in pairs:

# 2. PV + CR0205

PVCR0205_Table3 <- rbind(PV_Table3, CR_0205_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVCR0205_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 3. PV + CR0206

PVCR0206_Table3 <- rbind(CR_0206_Table3, PV_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVCR0206_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 4. PV + CR0207

PVCR0207_Table3 <- rbind(PV_Table3, CR_0207_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVCR0207_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 5. PV + CR0208

PVCR0208_Table3 <- rbind(PV_Table3, CR_0208_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVCR0208_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 6. PV + CR0209

PVCR0209_Table3 <- rbind(PV_Table3, CR_0209_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVCR0209_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 7. PV + CR0212

PVCR0212_Table3 <- rbind(PV_Table3, CR_0212_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVCR0212_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 8. PV + KI0090

PVKI0090_Table3 <- rbind(PV_Table3, KI_0090_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0090_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 9. PV + KI0091

PVKI0091_Table3 <- rbind(PV_Table3, KI_0091_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0091_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 10. PV + KI0092

PVKI0092_Table3 <- rbind(PV_Table3, KI_0092_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0092_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 11. PV + KI0093

PVKI0093_Table3 <- rbind(PV_Table3, KI_0093_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0093_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 12. PV + KI0094

PVKI0094_Table3 <- rbind(PV_Table3, KI_0094_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0094_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 13. PV + KI0095

PVKI0095_Table3 <- rbind(PV_Table3, KI_0095_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0095_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 14. PV + KI0096

PVKI0096_Table3 <- rbind(PV_Table3, KI_0096_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0096_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 15. PV + KI0097

PVKI0097_Table3 <- rbind(PV_Table3, KI_0097_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0097_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 16. PV + KI0098

PVKI0098_Table3 <- rbind(PV_Table3, KI_0098_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0098_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 17. PV + KI0099

PVKI0099_Table3 <- rbind(PV_Table3, KI_0099_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0099_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 18. PV + KI0100

PVKI0100_Table3 <- rbind(PV_Table3, KI_0100_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0100_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 19. PV + KI0101

PVKI0101_Table3 <- rbind(PV_Table3, KI_0101_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0101_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

# 19. PV + KI0101

PVKI0102_Table3 <- rbind(PV_Table3, KI_0102_Table3, make.row.names = FALSE)

ggplot2.histogram(data=PVKI0102_Table3, xName='Length', binwidth = 7000,
                  groupName='Individual', legendPosition="top",
                  alpha=0.5, position="identity", 
                  xTickLabelFont=c(9, "plain", "black"), yTickLabelFont=c(9, "plain", "black"), 
                  mainTitle="",
                  xtitle="introgressed segment length", ytitle="count",
                  xtitleFont=c(14, "plain", "black"), ytitleFont=c(14, "plain", "black"),
                  groupColors=c('orange','aquamarine3'),
                  backgroundColor="white", axisLine=c(0.5, "solid", "black"),
                  addMeanLine = TRUE, meanLineSize = 0.5) +
  scale_y_continuous(breaks=seq(0,40,5), limits = c(0, 40)) +
  scale_x_continuous(breaks=seq(0,700000,50000), limits = c(0, 700000))

##############################################################
##### ANOVA for Length and Percentage between Individual #####
##############################################################

# 1. aov for whole dataset Table 3 (T3) and Table 1 (T1)
T3_aova <- aov(log(Length) ~ Individual, data = All_Table3)
summary(T3_aova)
TukeyHSD(T3_aova)

T1A_aova <- aov(A_LP_WIN ~ INDIVIDUAL, data = All_Table1)
summary(T1A_aova)
TukeyHSD(T1A_aova)

T1B_aova <- aov(log(B_PCA_INTRO) ~ INDIVIDUAL, data = All_Table1)
summary(T1B_aova)
TukeyHSD(T1B_aova)

#########################
##### HeatMap trial #####
#########################

ggplot(data = PV_Table2, aes(x = W_number, y = rev(Scaffold))) +
  geom_tile(aes(fill = A_ancestry)) # NOT WORKING
