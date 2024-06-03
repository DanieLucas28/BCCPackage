
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

## Roadmap

- Add Changelog
- Add back to top links
- Add Additional Templates w/ Examples
- Add "components" document to easily copy & paste sections of the readme

See the [open issues](https://github.com/DanieLucas28/BCCPackage/issues) for a full list of proposed features (and known issues).

## License

Distributed under the GPL-3 License. See `LICENSE` for more information.

## Contact

Daniel Cerqueira - [danielcerqueira@live.com](mailto:danielcerqueira@live.com)

