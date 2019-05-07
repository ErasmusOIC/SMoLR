library(RImageJROI)
IJROI_statistics <- function(file,pxsize=5){
  if(file_ext(file)=="zip"){
    data <- RImageJROI::read.ijzip(file)
    out <- ldply(data,function(x) c(x$xrange*pxsize,x$yrange*pxsize))
    names(out) <- c("ROI_id","ROI_xmin","ROI_xmax","ROI_ymin","ROI_ymax")
  } else if (file_ext(file)=="roi"){
    data <- read.ijroi(file)
    tmp <- c(data$xrange*pxsize,data$yrange*pxsize)
    out <- data.frame("ROI_id"=1,"ROI_xmin"=0,"ROI_xmax"=0,"ROI_ymin"=0,"ROI_ymax"=0)
    out[1,2:5] <- tmp
  }
  invisible(out)
}

IJROI_subset <- function(x,file,pxsize,split){
  UseMethod("IJROI_subset")
}

IJROI_subset.default <- function(x,file,pxsize=5){
  
  if(file_ext(file)=="zip"){
    D <- x$Y/pxsize
    C <- x$X/pxsize
    data <- RImageJROI::read.ijzip(file)
    data <- llply(data,function(x){
      if (x$strType=="traced"){
        x$strType <- "polygon"
      }
      return(x)
    })
    class(data) <- "ijzip"
    
    
    
    
    maskdata<- llply(data, function(x){ 
      
      
      fwddata <- x
      revdata <- fwddata
      revdata$coords <- revdata$coords[nrow(revdata$coords):1,]
      
      maskdata <- tryCatch( {ij2spatstat(fwddata)} , 
                            error = function(e) {  return( ij2spatstat(revdata) ) } )
      
      return(maskdata)
    
      })   
    
    
    x <- llply(maskdata,function(y){
      x <- x[inside.owin(x = C,y = D,w=y),]
      return(x)
    })
    
    
  } else if (file_ext(file)=="roi"){
    D <- x$Y/pxsize
    C <- x$X/pxsize
    data <- read.ijroi(file)
    if(data$strType=="traced"){
      data$strType <- "ploygon"
    }
    
    fwddata <- data
    revdata <- fwddata
    revdata$coords <- revdata$coords[nrow(revdata$coords):1,]
    
    
    maskdata <- tryCatch( {ij2spatstat(fwddata)} , 
                          error = function(e) {  return( ij2spatstat(revdata) ) } )
     
    isin<-inside.owin(x = C,y = D,w=maskdata)
    x <- x[isin,]
  }
  return(x)
}



IJROI_subset.list <- function(x,file,pxsize=5){
  if(length(x)==length(file)){
    y <- list()
    for(i in 1:length(x)){
      y[[names(x)[i]]] <- IJROI_subset(x[[i]],file[i],pxsize)
    }
  } else{
    stop("localizations list and list of file of different length")
  }
  return(y)
}
#example
#locs <- IJROI_subset(localizations[[1]],file,5)

