#' @title Calculate Control Limits (Type 1)
#' @description Calculates control limits for type 1 control charts using given data and sizes.
#' @param data A numeric vector of data values.
#' @param sizes A numeric vector of sample sizes.
#' @return A list containing the lower and upper control limits, and the center.
#' @export
#' @examples
#'data("Montgomery2005")
#'calculate_limits_type1(Montgomery2005$Defective, Montgomery2005$Sample)

calculate_limits_type1 <- function(data, sizes) {
  center <- sum(data) / sum(sizes)
  n <- mean(sizes)
  alfa <- center*(((center*(1-center))/((center*(1-center))/n))-1)
  beta <- (1-center)*(((center*(1-center))/((center*(1-center))/n))-1)
  lcl <- qbeta(0.00135, alfa, beta)
  ucl <- qbeta(0.99865, alfa, beta)
  return(list(lcl=lcl, ucl=ucl, center=center))
}
