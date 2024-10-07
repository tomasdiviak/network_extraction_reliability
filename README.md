# **Reliability check for extracting network data from text sources**
This repository contains simple code for extracting network data from text sources and for conducting reliability assessment based on Diviák, T., & Lord, N. (2023). From text to ties: Extraction of corruption network data from deferred prosecution agreements. *Data & Policy*, 5, e4. doi: [10.1017/dap.2022.41](10.1017/dap.2022.41)


NOTE: the code in relCheckFin.R assumes the same ordering of nodes in order to assess the realibility of the extracted network. If the nodes are NOT in the same order in both matrices, they can either be re-arranged in UCINET or using the code in the other script in this repository: relCheckELtoMats.R (using the graph4lg package)


There were a total of five networks extracted. The *data* file contains .xlsx files which contain the edgelists, matrices, and attributes for each case where AE and SH refer to the solution of each individual coder that are to be compared. For instance, Airbus_SH.xlsx contains the edgelist with one version of the extraction/coding for the Airbus case. To conduct coding reliability analysis as described in the paper, this is to be compared with Airbus_AE.xlsx. 
