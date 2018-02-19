linkErrorCheck <-
  function(x,y,npl,z=NULL){
    
    # Check that x is a matrix
    if(is.null(nrow(x)) | is.null(ncol(x))){stop("Error: x must be a matrix.")}
    
    # Check y is a vector
    if(!is.vector(y)){stop("Error: y must be a vector.")}
    
    # Check npl is a vector
    if(!is.vector(npl)){stop("Error: npl must be a vector.")}
    
    # Check that length(npl)==length(y), if it doesn't send an error
    if(length(npl)!=length(y)){stop("Error: the length of npl must be equal to the length of y.")}
    
    # Check that nrow(x)==length(y), if it doesnt send an error
    if(nrow(x)!=length(y)){stop("Error: The length of y must equal the number of rows in x.")}
    
    # Check y==0 or y==1, if it doesn't send an error
    # if((length(y[y==0&!is.na(y)])+length(y[y==1&!is.na(y)])+length(y[is.na(y)]))==length(y)){stop("Error: y must be 0 or 1.")}
    temp <- y
    temp <- na.omit(temp)
    if((sum(temp==1)+sum(temp==0))!=length(temp)){stop("Error: y must be 0 or 1.")}
    
    # Z must be entered as a matrix if if there is only one covariate, check length(ncol(z))>0 (make sure it is a matrix)
    # check nrow(z)==length(y)
    # check z is a matrix, and that different values of z work
    
    if(!is.null(z)){
      if(is.vector(z)){
        if(length(z)!=nrow(x)){stop("Error: length(z) must be equal to nrow(x).")}
      }else if(!is.null(nrow(z)) & !is.null(ncol(z))){
        if(nrow(z)!=length(y)){stop("Error: nrow(z) must be equal to length(y).")}
      }else{stop("Error: z must either be a vector or a matrix.")}
    }
    
  }