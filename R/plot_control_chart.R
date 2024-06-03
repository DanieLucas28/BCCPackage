#' @title Plot Control Chart
#' @description Generates and plots a control chart using the given data, sizes, type, and control limits.
#' @param data A numeric vector of data values.
#' @param sizes A numeric vector of sample sizes.
#' @param type An integer representing the type of control chart (either 1 or 2).
#' @param limits A list containing the lower and upper control limits, and the center.
#' @param title A string for the plot title.
#' @return A plot of the control chart.
#' @export
#' @examples
#' data_values <- Montgomery2005$Defective
#' sample_sizes <- Montgomery2005$Sample
#' limits <- calculate_limits_type1(Montgomery2005$Defective, Montgomery2005$Sample)
#' plot_control_chart(data_values, sample_sizes, type=1, limits, "Sample Control Chart")

plot_control_chart <- function(data, type, limits, title, sizes=NULL) {
  # If the chart type is 1 (P chart), we need the sample sizes
  if (type == 1) {
    if (is.null(sizes)) {
      stop("sizes is required for type 1")
    }
  }
  # Adjust data for P chart by dividing by sample sizes
  if (type == 1) {
    data = data / sizes
  }

  # Set plot margins and background color
  par(mar=c(8, 4, 4, 4) + 0.1, bg="gray")

  # Set up the plot but don't actually plot the points yet
  plot(data, ylim=c(0, max(limits$ucl, max(data))), pch=20, xlab="Sample", ylab="Value", main=title, type="n", col="black", bg="gray", xaxt="n")

  # Add a white background rectangle to ensure the plot area is clear
  rect(par("usr")[1], par("usr")[3], par("usr")[2], par("usr")[4], col="white")

  # Custom x-axis labels based on the number of samples
  if (length(data) <= 20) {
    axis(1, at=1:length(data))
  } else {
    axis(1, at=seq(1, length(data), by=round(length(data)/20)))
  }

  # Connect the data points with lines and points
  lines(data, type="b", col="black", pch=20)

  # Draw the control limits (UCL and LCL) and center line (CL)
  abline(h=limits$lcl, col="#8B0000", lwd=1.5)
  abline(h=limits$ucl, col="#8B0000", lwd=1.5)
  abline(h=limits$center, col="black", lwd=1.5)

  # Apply Shewhart rules to flag out-of-control points
  flagged_points <- apply_shewhart_rules(data=data, limits=limits, type=type, sizes=sizes)
  points(flagged_points, data[flagged_points], pch=21, bg="red", cex=1.1)

  # Label the control limits on the right side of the plot
  axis(side=4, at=c(limits$lcl, limits$center, limits$ucl), labels=c("LCL", "CL", "UCL"), las=2, col.axis="black", cex.axis=1, tck=0)

  # Calculate some statistics to display below the plot
  sample_size <- length(data)
  beyond_limits <- sum(data > limits$ucl | data < limits$lcl)
  stdev <- sd(data)

  # Display the control limits, sample size, and other statistics below the plot
  mtext(paste("UCL =", round(limits$ucl, 4)), side=1, line=5, at=(par("usr")[1] + par("usr")[2]) / 4, cex=0.8)
  mtext(paste("LCL =", round(limits$lcl, 4)), side=1, line=5, at=(par("usr")[1] + par("usr")[2]) / 2, cex=0.8)
  mtext(paste("Center =", round(limits$center, 4)), side=1, line=5, at=3 * (par("usr")[1] + par("usr")[2]) / 4, cex=0.8)
  mtext(paste("Sample size =", sample_size), side=1, line=6, at=(par("usr")[1] + par("usr")[2]) / 4, cex=0.8)
  mtext(paste("Number beyond limits =", beyond_limits), side=1, line=6, at=(par("usr")[1] + par("usr")[2]) / 2, cex=0.8)
  mtext(paste("Standard Deviation =", round(stdev, 2)), side=1, line=6, at=3 * (par("usr")[1] + par("usr")[2]) / 4, cex=0.8)
}
