#### reliability assessment for corruption networks - edgelists to matrices ####
# tomas.diviak@manchester.ac.uk

# reading in the extracted edgelists
library(openxlsx)
codAE <- read.xlsx("Airbus_AE.xlsx", colNames = TRUE, sheet = 1)
codSH <- read.xlsx("Airbus_SH.xlsx", colNames = TRUE, sheet = 1)

# selecting the edgelists
library(tidyverse)
elAE <- select(codAE, source, target)
elSH <- select(codSH, source, target)

# removing rogue spaces
library(stringr)
elAE$source <- str_trim(elAE$source)
elAE$target <- str_trim(elAE$target)
elSH$source <- str_trim(elSH$source)
elSH$target <- str_trim(elSH$target)

# converting to igraph objects
library(igraph)
gAE <- graph_from_edgelist(as.matrix(elAE), directed = FALSE)
gSH <- graph_from_edgelist(as.matrix(elSH), directed = FALSE)

# getting adjacency matrices
matAE <- as_adjacency_matrix(gAE, sparse = FALSE)
matSH <- as_adjacency_matrix(gSH, sparse = FALSE)

# reordering matrices alphabetically to assure comparability
library(graph4lg)
namesAE <- sort(rownames(matAE))
matAEr <- reorder_mat(matAE, order = namesAE)

namesSH <- sort(rownames(matSH))
matSHr <- reorder_mat(matSH, order = namesSH)

identical(rownames(matAEr), rownames(matSHr)) # consistency check

# calculating graph correlation - reliability assessment
sna::gcor(matAEr, matSHr, mode = "graph") 
