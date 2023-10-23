#' @title Calculate Control Limits (Type 2)
#' @description Calculates control limits for type 2 control charts using given data and sizes.
#' @param data A numeric vector of data values.
#' @param sizes A numeric vector of sample sizes.
#' @return A list containing the lower and upper control limits, and the center.
#' @export

calculate_limits_type2 <- function(data) {
  center <- mean(data)
  v <- var(data)
  alfa <- center * ((center * (1-center) / v) - 1)
  beta <- (1 - center) * ((center * (1 - center) / v) - 1)
  lcl <- qbeta(0.00135, alfa, beta)
  ucl <- qbeta(0.99865, alfa, beta)
  return(list(lcl=lcl, ucl=ucl, center=center))
}
