% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/calculate_limits.R
\name{calculate_limits}
\alias{calculate_limits}
\title{Calculate Control Limits}
\usage{
calculate_limits(data, sizes = NULL, type)
}
\arguments{
\item{data}{A numeric vector of data values.}

\item{sizes}{An optional numeric vector of sample sizes. Required for type 1 charts.}

\item{type}{An integer representing the type of control chart. There are two possible types: \code{1} for discrete data and \code{2} for continuous data.}
}
\value{
A list containing the lower and upper control limits, and the center.
}
\description{
Calculates control limits for control charts using given data and sizes. Supports both type 1 (discrete data) and type 2 (continuous data) control charts.
}
\examples{
# Example for type 2 chart with continuous data
data_values <- c(0.55, 0.60, 0.65, 0.70, 0.75)
calculate_limits(data_values, type=2)
}
