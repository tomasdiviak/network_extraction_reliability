#### reliability assessment for corruption network data collection ####
# tomas.diviak@manchester.ac.uk

getwd()

# plan: 1) reliability check on extracted nodes
# 2) relibility check on constructed networks
# 3) reliability check on extracted attributes 

# 1) reliability of extracted nodes from the two edgelists
library(openxlsx)

# reading in the extracted edgelists
codAE <- read.xlsx("Airbus_AE.xlsx", colNames = TRUE, sheet = 1)
codSH <- read.xlsx("Airbus_SH.xlsx", colNames = TRUE, sheet = 1)

# concatenating source and target
allAE <- c(codAE$source, codAE$target)
allSH <- c(codSH$source, codSH$target)

# removing rogue spaces
library(stringr)

allAE <- str_trim(allAE)
allSH <- str_trim(allSH)

# unique elements only
unAE <- unique(allAE)
unSH <- unique(allSH)

# reliability = size of intersection / size of union
union(unAE, unSH)
intersect(unAE, unSH)
setdiff(unAE, unSH)

length(intersect(unAE, unSH))/length(union(unAE, unSH))


# 2) reliability of of constructed networks
# read in the network data as matrix created in UCINET
# UCINET sorts nodes in matrices alphabetically
# ALTERNATIVE: script relCheckELtoMats.R using graph4lg package
matAE <- as.matrix(read.xlsx("matsTest.xlsx", rowNames = T,
                                       colNames = T, sheet = 1))
matSH <- as.matrix(read.xlsx("matsTest.xlsx", rowNames = T,
                                       colNames = T, sheet = 2))
matAE
matSH

# correlate the matrices directly
library(sna)
gcor(matAE, matSH, mode = "graph")


# 3) reliability of extracted attributes
# read in the attribute data
attAE <- read.xlsx("Attributes AE.xlsx", colNames = TRUE, sheet = 5)
attSH <- read.xlsx("Attributes SH.xlsx", colNames = TRUE, sheet = 5)

# tabulate the attributes
tab <- table(attAE$publicAE, attSH$publicSH)
(tab[1,1] + tab[2,2]) / sum(tab)

prop.table(table(att$publicAE, att$publicSH))

sum(attAE$affil == attSH$affil)/nrow(attSH)
sum(attAE$gender == attSH$gender)/nrow(attSH)
sum(attAE$private == attSH$private)/nrow(attSH)
