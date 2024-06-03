#' Apply Shewhart Control Rules
#'
#' Identifies points in a control chart that violate Shewhart control rules. These rules help to determine if a process is out of control and requires corrective action.
#'
#' @param data A numeric vector of data values to be analyzed.
#' @param limits A list containing the control limits, specifically the lower control limit (LCL) and upper control limit (UCL).
#' @param type An integer representing the type of control chart. There are two possible types: \code{1} for discrete data (such as proportions or counts) and \code{2} for continuous data.
#' @param sizes An optional numeric vector of sample sizes. This parameter is typically required for type 1 charts.
#' @return A vector of indices corresponding to data points that violate the Shewhart control rules.
#' @export
#'
#' @examples
#' # Example with discrete data
#' data_values <- c(0.1, 0.2, 0.15, 0.3, 0.25)
#' sample_limits <- list(lcl=0.05, ucl=0.25, center=0.15)
#' apply_shewhart_rules(data_values, sample_limits, type=1)
#'
#' # Example with continuous data
#' data_values <- c(0.55, 0.60, 0.65, 0.70, 0.75)
#' sample_limits <- list(lcl=0.50, ucl=0.70, center=0.60)
#' apply_shewhart_rules(data_values, sample_limits, type=2)
#'
#'
apply_shewhart_rules <- function(data, limits, type, sizes=NULL){
  # Placeholder for points that meet the criteria of Shewhart rules
  points_to_color <- c()

  # Rule 1: Identify points outside of UCL or LCL
  outliers <- which(data > limits$ucl | data < limits$lcl)
  points_to_color <- c(points_to_color, outliers)

  # Return unique indices of points violating the rules
  return(unique(points_to_color))
}
