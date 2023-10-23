#' @title Apply Shewhart Control Rules
#' @description Identifies points in a control chart that violate Shewhart control rules.
#' @param data A numeric vector of data values.
#' @param limits A list containing the lower and upper control limits.
#' @param type An integer representing the type of control chart. There are two possible types: \code{1} for discrete data and \code{2} for continuous data.
#' @return A vector of indices corresponding to data points that meet the Shewhart rules.
#' @export
#' @examples
#' data_values <- Montgomery2005$Defective
#' sample_limits <- calculate_limits_type1(Montgomery2005$Defective, Montgomery2005$Sample)
#' apply_shewhart_rules(data_values, sample_limits)

apply_shewhart_rules <- function(data, limits, type, sizes=NULL){
  # Placeholder for points that meet criteria
  points_to_color <- c()
  # Rule 1: a point outside of UCL or LCL
  outliers <- which(data > limits$ucl | data < limits$lcl)
  points_to_color <- c(points_to_color, outliers)

  return(unique(points_to_color))
}
