## linkRare

The linkRare R package incorporates linkage data in genetic association studies of rare and common variants. 

## Installation
```
install.packages("devtools") #The devtools package must be installed first
install.packages("SKAT") #The SKAT package must be installed first

devtools::install_github("SharonLutz/linkRare")
```
## Example
For the given dataset dataL, we can test if the collection of rare variants (i.e. x) are associated with the binary outcome (i.e. y) given the NPL scores from the cases. The code below runs this analysis.
```
library(linkRare)
?linkRARE # For details on this function and how to choose input variables

data("dataL")
y<-dataL[,"y"] # outcome for case-control status. y=1 for case and y=0 for control
npl<-dataL[,"npl"] # npl score
x<-dataL[,1:54] # matrix of rare variants in the region
linkRARE(x,y,npl)
```

## Output
For this analysis using SKAT, we have the abbreviated following output and can see that the region is not associated with the outcome Y (p-value=0.31). Although, this association becomes marginally significant once we leverage the NPL scores from the cases (p-value=0.08).
```
Sample size (non-missing y and X) = 1000, which is < 2000. The small sample adjustment is applied!
Sample size (non-missing y and X) = 815, which is < 2000. The small sample adjustment is applied!

$`p-value from SKAT with all subjects`
[1] 0.3094984

$`p-value from SKAT excluding subjects with NPL<0`
[1] 0.08148013
```

## Reference
**Lutz SM**, et al. (2018) An Approach to Integrate Family-Specific Linkage Scores in Case-Control Tests of Associations of Rare Variants. (In Preparation) 
