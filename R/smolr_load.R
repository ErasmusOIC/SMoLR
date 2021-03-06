smolr_load <- function(folder,statistics=F,prename=""){
  load(file.path(folder,paste(prename,"localizations.Rdata",sep="")),.GlobalEnv)
  if (statistics==TRUE){
    
    load(file.path(folder,paste(prename,"statistics.Rdata",sep="")),.GlobalEnv)
    
    if(nrow(.GlobalEnv$statistics)!=length(.GlobalEnv$localizations)){ 
      
      warning("localizations and statistics not the same length")
    
      }
    
  }
  
}

SMOLR_LOAD <- function(folder,statistics,prename){
  UseMethod("SMOLR_LOAD")
}

SMOLR_LOAD.default <- function(folder,statistics=F,prename=""){
  smolr_load(folder,statistics,prename)
}