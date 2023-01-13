\name{SMOLR_PROFILE}
\alias{SMOLR_PROFILE}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Create a SMOLR Profile
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
This function creates a smolr profile to be used by the SMOLR_FAST_IMPORT function. This allows you to keep your data importing up to date even if the format of the data is changed by third parties.
}
\usage{
SMOLR_PROFILE(name, original, xypc, skip)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{name}{
%%     ~~Describe \code{name} here~~
String with the name of the profile
}
  \item{original}{
%%     ~~Describe \code{original} here~~
A vector containing Names of the headers of the original file
}
  \item{xypc}{
%%     ~~Describe \code{xycp} here~~
A vector containing the column numbers of the columns containing the x, y, precision and channel values respectivily  
}
  \item{skip}{
%%     ~~Describe \code{skip} here~~
Number of lines to skip before the header of the file. Default is 0. 
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
profile <- SMOLR_PROFILE("profile_name",c("ID","X","Y","First Frame","Precision","Channel","fit"),c(2,3,5,6),skip=0)
profile
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
