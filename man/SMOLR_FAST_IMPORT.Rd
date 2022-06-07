\name{SMOLR_FAST_IMPORT}
\alias{SMOLR_FAST_IMPORT}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
%%  ~~function to do ... ~~
Fast SMOLR importer using self made profile
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
Fast SMOLR importer making use of the data.table fread importer that performs faster on bigger data. This importer makes use a userdifinable profile.
}
\usage{
SMOLR_FAST_IMPORT(file, profile, channels)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{file}{
%%     ~~Describe \code{file} here~~
Location of the file txt or csv file to be imported
}
  \item{profile}{
%%     ~~Describe \code{profile} here~~
Profile of the to be imported data, this profile can be made using the SMOLR_PROFILE function
}
  \item{channels}{
%%     ~~Describe \code{channels} here~~
Channels that should be precent in the data, this allows to define channel numbers even if there are no localizations in the channels
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

% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory (show via RShowDoc("KEYWORDS")):
% \keyword{ ~kwd1 }
% \keyword{ ~kwd2 }
% Use only one keyword per line.
% For non-standard keywords, use \concept instead of \keyword:
% \concept{ ~cpt1 }
% \concept{ ~cpt2 }
% Use only one concept per line.
