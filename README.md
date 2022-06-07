## SMoLR (Single Molecule Localization in R)
SMoLR is a software package to analyze single-molecule super resolution data in R.

## Installation
R can be installed at: https://www.r-project.org/
For building SMoLR in R>=4.0.0 in windows rTools is needed and can be found here: https://cran.r-project.org/bin/windows/Rtools/

We recommend the use of Rstudio to work with SMoLR: https://www.rstudio.com/products/rstudio/#Desktop
```R
install.packages("devtools")  
library(devtools)  
if (!requireNamespace("BiocManager", quietly = TRUE)){
    install.packages("BiocManager")
}
BiocManager::install("EBImage") 

install_github("ErasmusOIC/SMoLR", build_vignettes = TRUE)

library(SMoLR)  
```

## Documentation
Documentation of the different functions in the package can be found in R. Additionally a vignette is available explaining the main functions of SMoLR.
The vignette can be found here:
https://htmlpreview.github.io/?https://github.com/ErasmusOIC/SMoLR_data/blob/master/SMoLR.html

or within R, after installing SMoLR, run:
```R
library(SMoLR)
vignette("SMoLR")
```

## Example data
Testing plot functions:
```R
library(SMoLR)
plot(SMOLR(smolrdata))
SMOLR_PLOT(smolrdata)
```
More example data to test the package can be found at the repository: https://github.com/ErasmusOIC/SMoLR_data

Loading example ThunderSTORM data:
```R
library(SMoLR)
download.file("https://github.com/ErasmusOIC/SMoLR_data/raw/master/thunderstorm.zip","thunderstorm.zip")
unzip("thunderstorm.zip")
SMOLR_IMPORT(file.path(getwd(),"thunderstorm"),profile="thunderstorm")
SMOLR_LOAD(file.path(getwd(),"thunderstorm"),statistics=F)
head(localizations[[1]])
```

## NEW 07-06-2022 Fast and flexible new import function
Create your own import profile to flexibly keep loading your data even if the data format is changed by third parties.
Create the profile with the headers used in the data file and the column number of the x, y, precision and channel columns respectivily. Shown below for imaginary data format.
```R
profile <- SMOLR_PROFILE("profile_name",c("ID","X","Y","First Frame","Precision","Channel","fit"),c(2,3,5,6),skip=0)
```
Import the data using the profile made. This import is using the fast fread function of data.table.
```R
data <- SMOLR_FAST_IMPORT(file,profile,channels)
```

## Bug reports and feature requests
Bug reports, feature requests, or any other issues with the package can be reported at github.

## Citation
If you use SMoLR please cite the paper describing SMoLR:
Paul, M.W., Gruiter, H.M. De, Lin, Z., Baarends, W.M., Cappellen, W.A. Van, Houtsmuller, A.B., and Slotman, J.A. (2019). SMoLR : visualization and analysis of single- molecule localization microscopy data in R. BMC Bioinformatics 1–7. doi: https://doi.org/10.1186/s12859-018-2578-3
