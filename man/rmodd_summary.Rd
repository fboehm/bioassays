\name{rmodd_summary}
\alias{rmodd_summary}
\title{Summarise a Numerical Vector with Control on Outlier Removal}
\description{
Summarise a numerical vector with control on how the outliers has to be treated.
}
\usage{
rmodd_summary(x, rm = "FALSE", strict = "FALSE", cutoff = 80,n = 3)
}

\arguments{
  \item{x}{ numerical vector}
  \item{rm}{ if rm = "TRUE" outliers are omitted. If rm = "FALSE" all elements in the vector are considered for summarising}
  \item{strict}{ if strict = "FALSE" outliers are omitted based on IQR rule. If strict = "TRUE" more aggressive outlier omitting method is used to bring CV below a cutoff value}
  \item{cutoff}{ cv cutoff value for the aggressive outlier removal}
  \item{n}{minimum number of samples needed}

}
\details{
In IQR rule (ie when strict = "FALSE") those values above 'Q3 + 1.5 IQR' and those below 'Q1 - 1.5 IQR' is considered as outlier.
For the aggressive outlier removal (ie when strict = "TRUE") those values above 90th percentile and  below 10th percentile are removed consecutively till the cv fall below the 'cutoff' or only the minimum number of samples is leftover (whichever happens first halt the loop).
}
\value{
  A  numeric vector of length 5 with the elements representing

 \item{mean }{the average of samples}
 \item{median }{the median of samples}
\item{n }{number of samples}
\item{sd }{standard deviation of samples}
\item{cv }{percentage cv of samples}
}

\author{
A.A Palakkan
}

\examples{
## data set x
x <- c(1.01,0.98,0.6,0.54,0.6,0.6,0.4,3)

## summarising without removing outliers
rmodd_summary(x, rm = "FALSE", strict= "FALSE", cutoff=80, n=3)

## summarising after removing outliers (IQR methord)
rmodd_summary(x, rm = "TRUE", strict= "FALSE", cutoff=20, n=5)

## summarising after removing outliers (Stringent to reduce cv)
rmodd_summary(x, rm = "TRUE", strict= "TRUE", cutoff=20, n=5)

}

\keyword{ arith }

