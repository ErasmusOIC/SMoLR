

smolr2import <- function(file,profile,channels=NULL){


  ### check profile class

  if(class(profile)!="smolr2profile"){
    stop("Profile provided is not a smolr2 profile")
  }

  ### read the file into a data table

  if(identical(profile$original_names,names(fread(file,nrow=0,skip = attr(profile,"skip"))))){ #check if headers fit profile

    d <- suppressWarnings(fread(file,skip = attr(profile,"skip") )) #supresses the warning about the end of the file not having all collumns
    nrows_before_omit <- nrow(d)
    d <- na.omit(d)
    nrows_after_omit <- nrow(d)
    deleted_lines <- nrows_before_omit - nrows_after_omit

    if(deleted_lines > 0){
      warning(paste(deleted_lines,"row(s) were deleted because they contained NAs"))
    }

  }else{
    stop("Imported file does not fit profile")
  }

  if(length(profile$new_names)>length(profile$original_names)){
    for(i in 1:(length(profile$new_names)-length(profile$original_names))){
      d <- cbind(d, rep( 1,nrow(d) ) )
    }
  }

  names(d) <- profile$new_names
  attr(d,"profile") <- profile
  attr(d,"channels_present") <- unique(d$Channel)
  attr(d,"user_def_channels") <- channels


  ### check data types

  if(!is.numeric(d$X)){
    d$X <- as.numeric(d$X)
    warning("Original values for X were not numeric. Values for X were converted to numeric")
  }
  if(!is.numeric(d$Y)){
    d$X <- as.numeric(d$Y)
    warning("Original values for Y were not numeric. Values for Y were converted to numeric")
  }
  if(!is.numeric(d$Precision)){
    d$X <- as.numeric(d$Precision)
    warning("Original values for Precision were not numeric. Values for Precision were converted to numeric")
  }

  d <- data.frame(d)

  return(d)

}

SMOLR_FAST_IMPORT <- function(file,profile,channels){
  UseMethod("SMOLR_FAST_IMPORT")
}

SMOLR_FAST_IMPORT.default <- function(file,profile,channels=NULL){
  smolr2import(file,profile,channels)
}





