## linkBayes

The linkBayes R package incorporates linkage data in genetic association studies with 2 approaches: 1) Bayesian Hierarchical model and 2) frequentist approach for rare variants. 

#### Installation
```
install.packages("devtools") #The devtools package must be installed first
install.packages("SKAT") #The SKAT package must be installed first

devtools::install_github("SharonLutz/linkBayes")
```
#### Example
For the given dataset dataL, we can test if the collection of rare variants (i.e. x) are associated with the binary outcome (i.e. y) given the NPL scores from the cases. The code below runs this analysis.
```
library(linkBayes)
?linkRARE # For details on this function and how to choose input variables

data("dataL")
y<-dataL[,"y"] # outcome for case-control status. y=1 for case and y=0 for control
npl<-dataL[,"npl"] # npl score
x<-dataL[,1:54] # matrix of rare variants in the region
linkRARE(x,y,npl)
```

#### Output
For this analysis, we have the following output and can see that the region is not associated with the outcome Y (p-value=0.36). Although, this association becomes marginally significant once we leverage the NPL scores from the cases (p-value=0.09).
```
$`p-value from SKAT with all subjects`
[1] 0.3589297

$`number of rare variants with all subjects`
[1] 32

$`p-value from SKAT excluding subjects with NPL<0`
[1] 0.09791944

$`number of rare variants excluding subjects with NPL<0`
[1] 30
```
#### Reference
**Lutz SM**, Pelijto A, Thwing A, Zhang W, Fingerlin TE (2017) A Bayesian Approach to Integrate Family-Specific Linkage Scores in Case-Control Tests of Association. (In Preparation)

**Lutz SM**, Pelijto A, Thwing A,  Zhang W, Fingerlin TE (2017) An Approach to Integrate Family-Specific Linkage Scores in Case-Control Tests of Associations of Rare Variants. (In Preparation) 
