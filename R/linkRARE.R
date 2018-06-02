linkRARE <-
  function(x,y,npl,z=NULL,SEED=1){
    
    linkErrorCheck(x,y,npl,z)
    
    library(SKAT)
    
    set.seed(SEED)
    
    #####################
    # format data
    ######################
    
    # format X to be a matrix
    # changes x to X
    X<-matrix(0,nrow=nrow(x),ncol=ncol(x))
    for(pp in 1:ncol(x)){X[,pp]<-x[,pp]}
    
    # format Z to be a matrix
    # changes z to Z
    if(!is.null(z)){
      if(is.vector(z)){
        Z <- matrix(0,nrow=length(z),ncol=1)
        for(pp in 1:length(z)){Z[pp,]<-z[pp]}
      }
      else{
        Z <- matrix(0,nrow=nrow(z),ncol=ncol(z))
        for(pp in 1:ncol(z)){Z[,pp]<-z[,pp]}
      }
    }else{
      Z <- NULL
    }
    
    # subjects with positive npl scores
    indZ<-c(1:length(npl))
    indZp<-indZ[(npl>0|npl==0)|is.na(npl)]
    
    # length(z)==0 when z is null
    if(length(Z)==0){
      dataP<-cbind(X,y)
      dataP<-dataP[indZp,]
      yN<-dataP[,ncol(dataP)]
      Xn<-dataP[,1:(ncol(dataP)-1)]	
    }else{
      dataP<-cbind(X,y,Z)
      dataP<-dataP[indZp,]
      yN<-dataP[,(ncol(dataP)-ncol(Z))]
      zN<-dataP[,(ncol(dataP)-ncol(Z)+1):(ncol(dataP))]
      Xn<-dataP[,1:(ncol(dataP)-ncol(Z)-1)]
    }
    
    #########################
    ## SKAT with all subjects
    #########################
    if(length(Z)==0){obj1<-SKAT_Null_Model(y ~ 1, out_type="D")
    }else{obj1<-SKAT_Null_Model(y ~ Z, out_type="D")}
    
    modelA<-SKAT(X, obj1)
    skatAp<-modelA$p.value
    skatAn<-modelA$param$n.marker.test
    
    modelAo<-SKAT(X, obj1,method="SKATO")
    skatApo<-modelAo$p.value
    skatAno<-modelAo$param$n.marker.test
    
    #########################
    ## SKAT excluding subjects 
    ## with NPL score <0
    #########################
    if(length(Z)==0){obj2<-SKAT_Null_Model(yN ~ 1, out_type="D")
    }else{obj2<-SKAT_Null_Model(yN ~ zN, out_type="D")}
    
    modelP<-SKAT(Xn, obj2)
    skatPp<-modelP$p.value
    skatPn<-modelP$param$n.marker.test
    
    modelPo<-SKAT(Xn, obj2,method="SKATO")
    skatPpo<-modelPo$p.value
    skatPno<-modelPo$param$n.marker.test
    #########################
    ## output
    #########################
    output<-list(skatAp,skatApo,skatAn,skatPp,skatPpo,skatPn)
 
    output}
