#' Beta Control Charts
#'
#' The Beta Chart presents control limits based on the Beta probability distribution. It is used for monitoring fraction data from a Binomial distribution as a replacement for p-Charts. The Beta Chart has been applied in three real studies, demonstrating its effectiveness. Comparative analysis revealed that: (i) the Beta approximation to the Binomial distribution is more appropriate for values confined within the \code{[0, 1]} interval; and (ii) the proposed charts are more sensitive to the average run length (ARL) in both in-control and out-of-control process monitoring. Overall, the Beta Charts outperform the Shewhart control charts for monitoring fraction data.
#'
#' @aliases bcc
#' @description Creates and displays a Beta control chart using the specified data, sample sizes, and type. This is the main function for generating control charts in this package.
#' @export
#'
#' @param data A numeric vector of data values to be plotted on the control chart.
#' @param sizes An optional numeric vector of sample sizes. This parameter is required for type 1 charts, which are designed for discrete data.
#' @param type An integer representing the type of control chart. There are two possible types: \code{1} for discrete data (such as proportions or counts) and \code{2} for continuous data.
#' @param title An optional string specifying the title of the plot.
#' @return A plot of the Beta control chart.
#'
#' @examples
#' # Example for type 1 chart with discrete data
#' data <- c(0.12, 0.18, 0.14, 0.28, 0.22)
#' sizes <- c(101, 98, 110, 105, 95)
#' bcc(data, sizes, type=1, title="Beta Control Chart for Discrete Data")
#'
#' # Example for type 2 chart with continuous data
#' data <- c(0.59, 0.67, 0.61, 0.70, 0.59)
#' bcc(data, type=2, title="Beta Control Chart for Continuous Data")
#'
#' # Example changing the title of the chart
#' data <- c(0.07, 0.13, 0.21, 0.25, 0.19)
#' sizes <- c(52, 49, 51, 53, 48)
#' bcc(data, sizes, type=1, title="Custom Title: Beta Control Chart for Discrete Data")
#'
bcc <- function(data, sizes=NULL, type, title=NULL) {
  # If no title is provided, create a default title using the name of the data variable
  if (is.null(title)) {
    title <- paste("Beta Control Chart for", deparse(substitute(data)))
  }

  # Check if the type is 1 (discrete data)
  if (type == 1) {
    # Ensure sizes vector is provided for type 1
    if (is.null(sizes)) {
      stop("sizes is required for type 1")
    }
    # Ensure the sizes vector has the same length as the data vector
    if (length(sizes) != length(data)) {
      stop("Length of 'sizes' vector must be the same as 'data'.")
    }
    # Calculate control limits for type 1
    limits <- calculate_limits(data, sizes, type)
    # Plot the control chart with the calculated limits
    plot_control_chart(data=data, sizes=sizes, type=type, limits=limits, title=title)

    # Check if the type is 2 (continuous data)
  } else if (type == 2) {
    # Calculate control limits for type 2
    limits <- calculate_limits(data, type=type)
    # Plot the control chart with the calculated limits
    plot_control_chart(data=data, type=type, limits=limits, title=title)

    # If an invalid type is specified, raise an error
  } else {
    stop("Invalid type specified.")
  }
}

