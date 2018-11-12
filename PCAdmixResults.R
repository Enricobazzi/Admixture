# import the table with na values filling the empty spaces
help("heatmap.2")
library(readr)
install.packages("plyr")
library(plyr)

# get line for each scaffold
read_delim (file = "~/home/pcadmixzerosandones.txt", delim = " ", na = c("", "NA"))
raw <- read_delim (file = "~/home/pcadmixzerosandones.txt", delim = " ", col_names = FALSE, na = c("", "NA"))
colnames(raw) <- paste0(formatC(seq(1:ncol(raw)), width=3, flag="0"))
head (raw)
nrow(raw)

# get duplicated scaffold names
scaffolds <- as.data.frame (read_delim("~/home/lp23_scaffolds_tobephased_pcadmix.txt", delim = " ", col_names = FALSE))
colnames(scaffolds) <- paste0("scaffold")
scaffolds_a <- mutate(scaffolds, ord = seq (1:nrow(scaffolds)))
scaffolds_a$scaffold <- paste0(scaffolds$scaffold, "_a")
scaffolds_b <- mutate(scaffolds, ord = seq (1:nrow(scaffolds)))
scaffolds_b$scaffold <- paste0(scaffolds$scaffold, "_b")
scaffolds_ab <- arrange ((as.data.frame(rbind.data.frame(scaffolds_a, scaffolds_b, make.row.names = FALSE))), ord)

# unite duplicated scaffold names with their respective line
scaffcolumn <- as.data.frame(scaffolds_ab[,1, drop=FALSE])
PCAdmixResults <- cbind(scaffcolumn, raw)
str(PCAdmixResults)

PCAdmix_HEAD <- PCAdmixResults[c(1:20),]

# heat mapping to show results
library(ggplot2)
library(tidyr)

Vertical_Head <- PCAdmix_HEAD %>% gather(position,ancestry,-scaffold)
Vertical_Head <- PCAdmix_HEAD[,c(1:50,500:690)] %>% gather(position,ancestry,-scaffold)

ggplot(data = Vertical_Head, aes(x = position, y = scaffold)) +
  geom_tile(aes(fill = ancestry)) # needs vertical table data

Vertical_PCAdmix <- PCAdmixResults %>% gather(position,ancestry,-scaffold)
str(Vertical_PCAdmix)

Vertical_PCAdmix$scaffold <- as.factor(Vertical_PCAdmix$scaffold)

ggplot(data = Vertical_PCAdmix, aes(x = position, y = rev(scaffold))) +
  geom_tile(aes(fill = ancestry)) # needs vertical table data

ggsave("~/home/try", width=25, height=25, units="cm", device="pdf")


# with hundredKb data
rawHKb <- read_delim (file = "~/home/hundredKB.txt", delim = " ", col_names = FALSE, na = c("", "NA"))
colnames(rawHKb) <- paste0(formatC(seq(1:ncol(rawHKb)), width=3, flag="0"))
HKbResults <- cbind(scaffcolumn, rawHKb)
Vertical_HKb <- HKbResults %>% gather(position,ancestry,-scaffold)

ggplot(data = Vertical_HKb, aes(x = position, y = rev(scaffold))) +
  geom_tile(aes(fill = ancestry)) # needs vertical table data

# with Carpathians data (12 haplotypes) -> remove s36513 from list of scaffolds!!
rawCR <- read_delim (file = "~/home/Carpathians.txt", delim = " ", col_names = FALSE, na = c("", "NA"))
colnames(rawCR) <- paste0(formatC(seq(1:ncol(rawCR)), width=3, flag="0"))

scaffoldsCR <- as.data.frame (read_delim("~/home/lp23_scaffolds_tobephased_CR.txt", delim = " ", col_names = FALSE))
colnames(scaffoldsCR) <- paste0("scaffold")
scaffoldsCR_a <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_a$scaffold <- paste0(scaffoldsCR$scaffold, "_a")
scaffoldsCR_b <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_b$scaffold <- paste0(scaffoldsCR$scaffold, "_b")
scaffoldsCR_c <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_c$scaffold <- paste0(scaffoldsCR$scaffold, "_c")
scaffoldsCR_d <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_d$scaffold <- paste0(scaffoldsCR$scaffold, "_d")
scaffoldsCR_e <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_e$scaffold <- paste0(scaffoldsCR$scaffold, "_e")
scaffoldsCR_f <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_f$scaffold <- paste0(scaffoldsCR$scaffold, "_f")
scaffoldsCR_g <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_g$scaffold <- paste0(scaffoldsCR$scaffold, "_g")
scaffoldsCR_h <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_h$scaffold <- paste0(scaffoldsCR$scaffold, "_h")
scaffoldsCR_i <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_i$scaffold <- paste0(scaffoldsCR$scaffold, "_i")
scaffoldsCR_l <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_l$scaffold <- paste0(scaffoldsCR$scaffold, "_l")
scaffoldsCR_m <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_m$scaffold <- paste0(scaffoldsCR$scaffold, "_m")
scaffoldsCR_n <- mutate(scaffoldsCR, ord = seq (1:nrow(scaffoldsCR)))
scaffoldsCR_n$scaffold <- paste0(scaffoldsCR$scaffold, "_n")


scaffoldsCR_abc <- arrange ((as.data.frame(rbind.data.frame(scaffoldsCR_a, scaffoldsCR_b, scaffoldsCR_c, scaffoldsCR_d, scaffoldsCR_e, scaffoldsCR_f, scaffoldsCR_g, scaffoldsCR_h, scaffoldsCR_i, scaffoldsCR_l, scaffoldsCR_m, scaffoldsCR_n, make.row.names = FALSE))), ord)
scaffcolumnCR <- as.data.frame(scaffoldsCR_abc[,1, drop=FALSE])

ResultsCR <- cbind(scaffcolumnCR, rawCR)
Vertical_CR <- ResultsCR %>% gather(position,ancestry,-scaffold)

ggplot(data = Vertical_CR, aes(x = position, y = rev(scaffold))) +
  geom_tile(aes(fill = ancestry)) # needs vertical table data

# With Carpathians and Pais Vasco

rawPVCR <- read_delim (file = "~/home/PVCR.txt", delim = " ", col_names = FALSE, na = c("", "NA"))
colnames(rawPVCR) <- paste0(formatC(seq(1:ncol(rawPVCR)), width=3, flag="0"))

scaffoldsPVCR <- as.data.frame (read_delim("~/home/lp23_scaffolds_tobephased_PVCR.txt", delim = " ", col_names = FALSE))

colnames(scaffoldsPVCR) <- paste0("scaffold")

scaffoldsPVCR_a <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_a$scaffold <- paste0(scaffoldsPVCR$scaffold, "_a")
scaffoldsPVCR_b <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_b$scaffold <- paste0(scaffoldsPVCR$scaffold, "_b")
scaffoldsPVCR_c <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_c$scaffold <- paste0(scaffoldsPVCR$scaffold, "_c")
scaffoldsPVCR_d <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_d$scaffold <- paste0(scaffoldsPVCR$scaffold, "_d")
scaffoldsPVCR_e <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_e$scaffold <- paste0(scaffoldsPVCR$scaffold, "_e")
scaffoldsPVCR_f <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_f$scaffold <- paste0(scaffoldsPVCR$scaffold, "_f")
scaffoldsPVCR_g <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_g$scaffold <- paste0(scaffoldsPVCR$scaffold, "_g")
scaffoldsPVCR_h <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_h$scaffold <- paste0(scaffoldsPVCR$scaffold, "_h")
scaffoldsPVCR_i <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_i$scaffold <- paste0(scaffoldsPVCR$scaffold, "_i")
scaffoldsPVCR_l <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_l$scaffold <- paste0(scaffoldsPVCR$scaffold, "_l")
scaffoldsPVCR_m <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_m$scaffold <- paste0(scaffoldsPVCR$scaffold, "_m")
scaffoldsPVCR_n <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_n$scaffold <- paste0(scaffoldsPVCR$scaffold, "_n")
scaffoldsPVCR_o <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_o$scaffold <- paste0(scaffoldsPVCR$scaffold, "_o")
scaffoldsPVCR_p <- mutate(scaffoldsPVCR, ord = seq (1:nrow(scaffoldsPVCR)))
scaffoldsPVCR_p$scaffold <- paste0(scaffoldsPVCR$scaffold, "_p")



scaffoldsPVCR_abcd <- arrange ((as.data.frame(rbind.data.frame(scaffoldsPVCR_a, scaffoldsPVCR_b, scaffoldsPVCR_c, scaffoldsPVCR_d, scaffoldsPVCR_e, scaffoldsPVCR_f, scaffoldsPVCR_g, scaffoldsPVCR_h, scaffoldsPVCR_i, scaffoldsPVCR_l, scaffoldsPVCR_m, scaffoldsPVCR_n, scaffoldsPVCR_o, scaffoldsPVCR_p, make.row.names = FALSE))), ord)
scaffcolumnPVCR <- as.data.frame(scaffoldsPVCR_abcd[,1, drop=FALSE])

ResultsPVCR <- cbind(scaffcolumnPVCR, rawPVCR)
Vertical_PVCR <- ResultsPVCR %>% gather(position,ancestry,-scaffold)

ggplot(data = Vertical_PVCR, aes(x = position, y = rev(scaffold))) +
  geom_tile(aes(fill = ancestry)) # needs vertical table data


