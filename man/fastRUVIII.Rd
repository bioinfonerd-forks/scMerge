% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fastRUVIII.R
\name{fastRUVIII}
\alias{fastRUVIII}
\title{fastRUVIII}
\usage{
fastRUVIII(Y, M, ctl, k = NULL, eta = NULL, fast_svd = FALSE,
  rsvd_prop = 0.1, include.intercept = TRUE, average = FALSE,
  fullalpha = NULL, return.info = FALSE, inputcheck = TRUE)
}
\arguments{
\item{Y}{The unnormalised SC data. A m by n matrix, where m is the number of observations and n is the number of features.}

\item{M}{The replicate mapping matrix.
The mapping matrix has m rows (one for each observation), and each column represents a set of replicates. The (i, j)-th entry of the mapping matrix is 1 if the i-th observation is in replicate set j, and 0 otherwise.
See ruv::RUVIII for more details.}

\item{ctl}{An index vector to specify the negative controls. Either a logical vector of length n or a vector of integers.}

\item{k}{The number of unwanted factors to remove. This is inherited from the ruvK argument from the scMerge::scMerge function.}

\item{eta}{Gene-wise (as opposed to sample-wise) covariates. See ruv::RUVIII for details.}

\item{rsvd_prop}{rsvd_prop is used to control for the accuracy of the randomized SVD computation.
If a lower value is used on a lower dimensional data (say < 1000 cell) will potentially yield a less accurate computed result but with a gain in speed.
The default of 0.1 tends to achieve a balance between speed and accuracy.}

\item{include.intercept}{When eta is specified (not NULL) but does not already include an intercept term, this will automatically include one.
See ruv::RUVIII for details.}

\item{average}{Average replicates after adjustment. See ruv::RUVIII for details.}

\item{fullalpha}{Not used. Please ignore. See ruv::RUVIII for details.}

\item{return.info}{Additional information relating to the computation of normalised matrix. We recommend setting this to true.}

\item{inputcheck}{We recommend setting this to true.}
}
\description{
perform fastRUVIII
}
\examples{
L = scMerge::ruvSimulate(m = 1000, n = 3000, nc = 50, nRep = 10)
Y = L$Y; M = L$M; ctl = L$ctl
improved1 = scMerge::fastRUVIII(Y = Y, M = M, ctl = ctl, k = 20, fast_svd = FALSE)
improved2 = scMerge::fastRUVIII(Y = Y, M = M, ctl = ctl, k = 20, fast_svd = TRUE, rsvd_prop = 0.1)
old = ruv::RUVIII(Y = Y, M = M, ctl = ctl, k = 20)
all.equal(improved1, old)
all.equal(improved2, old)
}
\author{
Yingxin Lin, John Ormerod, Kevin Wang
}
