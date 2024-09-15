# Beta Control Charts (bcc)

[![GitHub issues](https://img.shields.io/github/issues/DanieLucas28/BCCPackage)](https://github.com/DanieLucas28/BCCPackage/issues)
[![GitHub stars](https://img.shields.io/github/stars/DanieLucas28/BCCPackage)](https://github.com/DanieLucas28/BCCPackage/stargazers)
![R](https://img.shields.io/badge/R-4.0%2B-blue?logo=r&logoColor=white)
![ggplot2](https://img.shields.io/badge/ggplot2-3.3.3%2B-orange?logo=ggplot&logoColor=white)
![dplyr](https://img.shields.io/badge/dplyr-1.0.2%2B-green?logo=dplyr&logoColor=white)

## Table of Contents

1. [About The Project](#about-the-project)
2. [Getting Started](#getting-started)
    - [Installation](#installation)
3. [Usage](#usage)
4. [Roadmap](#roadmap)
5. [License](#license)
6. [Contact](#contact)

## About The Project

The **Beta Control Charts (bcc)** package provides tools to apply beta control charts to defined values. The Beta Chart presents control limits based on the Beta probability distribution and is used for monitoring fraction data from a Binomial distribution as a replacement for p-Charts. This package helps to effectively monitor variables, offering enhanced sensitivity in process control.

The Beta Chart has been applied in three real studies and compared with control limits from three different schemes. The comparative analysis showed that: (i) the Beta approximation to the Binomial distribution is more appropriate for values confined within the [0, 1] interval; and (ii) the proposed charts are more sensitive to the average run length (ARL) in both in-control and out-of-control process monitoring. Overall, the Beta Charts outperform the Shewhart control charts in monitoring fraction data.

This package not only provides a robust alternative to traditional p-Charts but also ensures more accurate and sensitive monitoring of fraction data, making it an invaluable tool for quality control and process improvement. For more details, see [Ângelo Márcio Oliveira Sant’Anna and Carla Schwengber ten Caten (2012)](doi:10.1016/j.eswa.2012.02.146)

Official CRAN page: https://cran.r-project.org/package=bcc

### Built With

- R
- ggplot2
- dplyr

## Getting Started

### By Cran Repository:

```r
install.packages("bcc")
```

### With Devtools:

Ensure you have [R](https://www.r-project.org/) and devtools installed on your machine:


```r
install.packages("devtools")
```
### Installation

1. Clone the repo:
   ```r
   git clone https://github.com/DanieLucas28/BCCPackage.git
    ```

2. Install the package:
   ```r
   devtools::install("BCCPackage")
    ```
   
## Usage

Here are some examples of how to use the package:

### Example for Type 1 Chart with Discrete Data

```r
library(bcc)
data <- c(0.12, 0.18, 0.14, 0.28, 0.22)
sizes <- c(101, 98, 110, 105, 95)
bcc(data, sizes, type=1, title="Beta Control Chart for Discrete Data")
```
### Example for Type 2 Chart with Continuous Data

```r
data <- c(0.59, 0.67, 0.61, 0.70, 0.75)
bcc(data, type=2, title="Beta Control Chart for Continuous Data")
```

See the [open issues](https://github.com/DanieLucas28/BCCPackage/issues) for a full list of proposed features (and known issues).

## License

Distributed under the GPL-3 License.
## Contact

Daniel Cerqueira - [danielcerqueira@live.com](mailto:danielcerqueira@live.com)

