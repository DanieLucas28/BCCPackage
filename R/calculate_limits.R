#' @title Calculate Control Limits
#' @description Calculates control limits for control charts using given data and sizes. Supports both type 1 (discrete data) and type 2 (continuous data) control charts.
#' @param data A numeric vector of data values.
#' @param sizes An optional numeric vector of sample sizes. Required for type 1 charts.
#' @param type An integer representing the type of control chart. There are two possible types: \code{1} for discrete data and \code{2} for continuous data.
#' @return A list containing the lower and upper control limits, and the center.
#' @export
#' @examples
#' # Example for type 2 chart with continuous data
#' data_values <- c(0.55, 0.60, 0.65, 0.70, 0.75)
#' calculate_limits(data_values, type=2)
#' @importFrom stats qbeta sd var
#'
calculate_limits <- function(data, sizes=NULL, type) {
  if (type == 1) {
    if (is.null(sizes)) {
      stop("sizes is required for type 1")
    }
    center <- sum(data) / sum(sizes)
    n <- mean(sizes)
    v <- (center * (1 - center)) / n
  } else if (type == 2) {
    center <- mean(data)
    v <- var(data)
  } else {
    stop("Invalid type. Type must be 1 or 2.")
  }

  alfa <- center * ((center * (1 - center) / v) - 1)
  beta <- (1 - center) * ((center * (1 - center) / v) - 1)
  lcl <- qbeta(0.00135, alfa, beta)
  ucl <- qbeta(0.99865, alfa, beta)

  return(list(lcl=lcl, ucl=ucl, center=center))
}
