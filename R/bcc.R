#' Beta Control Charts
#'
#' The Beta Chart presents the control limits based on the Beta probability distribution.  It was can be used for monitoring fraction data from Binomial distribution as replacement of the p-Charts. The Beta Chart was applied for monitoring the variables in three real studies, and it was compared to the control limits with three schemes. The comparative analysis showed that: (i) Beta approximation to the Binomial distribution was more appropriate with values confined in the [0, 1]- interval; and (ii) the charts proposed were more sensitive to the average run length (ARL), in both in-control and out-of-control processes monitoring. The Beta Charts outperform the Shewhart control charts analyzed for monitoring fraction data.
#' @aliases bcc
#' @description Creates and displays a beta control chart using the specified data, sizes, and type.
#' This is the main function to use for generating control charts.
#' @export bcc

#' @param data A numeric vector of data values.
#' @param sizes An optional numeric vector of sample sizes. Required for type 1 charts.
#' @param type An integer representing the type of control chart. There are two possible types: \code{1} for discrete data and \code{2} for continuous data.
#' @param title An optional string for the plot title.
#' @return A plot of the beta control chart.
#'
#'
#' @references SANT'ANNA, Ângelo M. O; CATEN, Carla Schwengber ten. Beta control charts forsave monitoring fraction data. Expert Systems With Applications, p. 10236-10243. 1 set. 2012.
#' @references Scrucca, L. (2004). qcc: an R package for quality control charting and statistical process control. \emph{R News} 4/1, 11-17.
#'
#'
#'@examples
#'data("Montgomery2005")
#'bcc(Montgomery2005$Defective, Montgomery2005$Sample, type=1)

bcc <- function(data, sizes=NULL, type, title=NULL) {

  if (is.null(title)) {
    title <- paste("Beta Control Chart for", deparse(substitute(data)))
  }
  if (type == 1) {
    if (is.null(sizes)) {
      stop("sizes is required for type 1")
    }}
  if(type == 1) {
    if(is.null(sizes)) stop("Sizes vector is required for type 1.")
    if(length(sizes) != length(data)) stop("Length of 'sizes' vector must be the same as 'data'.")
    limits <- calculate_limits_type1(data, sizes)
    plot_control_chart(data=data, sizes=sizes, type=type, limits=limits, title=title)
  } else if(type == 2) {
    limits <- calculate_limits_type2(data)
    plot_control_chart(data=data, type=type, limits=limits, title=title)
  } else {
    stop("Invalid type specified.")
  }
}
