# BCCPackage
# Beta Control Charts (bcc)

[![GitHub issues](https://img.shields.io/github/issues/DanieLucas28/BCCPackage)](https://github.com/DanieLucas28/BCCPackage/issues)
[![GitHub forks](https://img.shields.io/github/forks/DanieLucas28/BCCPackage)](https://github.com/DanieLucas28/BCCPackage/network)
[![GitHub stars](https://img.shields.io/github/stars/DanieLucas28/BCCPackage)](https://github.com/DanieLucas28/BCCPackage/stargazers)
[![GitHub license](https://img.shields.io/github/license/DanieLucas28/BCCPackage)](https://github.com/DanieLucas28/BCCPackage/blob/main/LICENSE)

## Table of Contents

1. [About The Project](#about-the-project)
2. [Getting Started](#getting-started)
    - [Prerequisites](#prerequisites)
    - [Installation](#installation)
3. [Usage](#usage)
4. [Roadmap](#roadmap)
5. [License](#license)
6. [Contact](#contact)
7. [Acknowledgments](#acknowledgments)

## About The Project

The **Beta Control Charts (bcc)** package provides tools to apply beta control charts to defined values. The Beta Chart presents control limits based on the Beta probability distribution and is used for monitoring fraction data from a Binomial distribution as a replacement for p-Charts. This package helps to effectively monitor variables, offering enhanced sensitivity in process control.

### Built With

- [R](https://www.r-project.org/)
- [ggplot2](https://ggplot2.tidyverse.org/)
- [dplyr](https://dplyr.tidyverse.org/)

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

Ensure you have R and devtools installed on your machine:
    ```r
    install.packages("devtools")```

### Installation

1. Clone the repo:
   ```sh
   git clone https://github.com/DanieLucas28/BCCPackage.git

2. Install the package:
   ```sh
   devtools::install("BCCPackage")

## Usage

Here are some examples of how to use the package:

### Example for Type 1 Chart with Discrete Data

    ```r
    library(bcc)
    data <- c(0.12, 0.18, 0.14, 0.28, 0.22)
    sizes <- c(101, 98, 110, 105, 95)
    bcc(data, sizes, type=1, title="Beta Control Chart for Discrete Data")

### Example for Type 2 Chart with Continuous Data
data <- c(0.59, 0.67, 0.61, 0.70, 0.75)
bcc(data, type=2, title="Beta Control Chart for Continuous Data")

