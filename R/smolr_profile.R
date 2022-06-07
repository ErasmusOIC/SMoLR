### create a profile to be used in the importer

smolr2CreateProfile <- function(name,original,xypc,skip=0){

  cleanup_string <- function(x){
    x <- gsub("[^A-Z^a-z^0-9^ ]","\\1",x) #replace non alphanumeric with ""
    x <- gsub("[ ]","\\1_",x) #replace spaces with "_"
    if(grepl("^Ch",x,ignore.case=T) ){
      x <- gsub("Ch","\\1_",x,ignore.case = T)
    }
    return(x)
  }

  profile <- list()
  profile[["profile_name"]] <- name
  profile[["original_names"]] <- original
  new_names <- sapply(original,cleanup_string)
  names(new_names) <- NULL
  new_names[xypc[1]] <- "X"
  new_names[xypc[2]] <- "Y"
  new_names[xypc[3]] <- "Precision"
  new_names[xypc[4]] <- "Channel"
  profile[["new_names"]] <- new_names
  class(profile) <- "smolr2profile"

  attr(profile,"xypc") <- xypc
  attr(profile,"skip") <- skip

  return(profile)

}

SMOLR_PROFILE <- function(name,original,xycp,skip){
  UseMethod("smolr2CreateProfile")
}
