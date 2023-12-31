% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/plot_control_chart.R
\name{plot_control_chart}
\alias{plot_control_chart}
\title{Plot Control Chart}
\usage{
plot_control_chart(data, type, limits, title, sizes = NULL)
}
\arguments{
\item{data}{A numeric vector of data values.}

\item{type}{An integer representing the type of control chart (either 1 or 2).}

\item{limits}{A list containing the lower and upper control limits, and the center.}

\item{title}{A string for the plot title.}

\item{sizes}{A numeric vector of sample sizes.}
}
\value{
A plot of the control chart.
}
\description{
Generates and plots a control chart using the given data, sizes, type, and control limits.
}
\examples{
data_values <- Montgomery2005$Defective
sample_sizes <- Montgomery2005$Sample
limits <- calculate_limits_type1(Montgomery2005$Defective, Montgomery2005$Sample)
plot_control_chart(data_values, sample_sizes, type=1, limits, "Sample Control Chart")
}
