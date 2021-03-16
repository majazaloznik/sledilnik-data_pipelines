# Sledilnik data pipeline visualisation and presentation

[![R](https://github.com/stefanb/sledilnik-data_pipelines/actions/workflows/r.yml/badge.svg)](https://github.com/stefanb/sledilnik-data_pipelines/actions/workflows/r.yml)

Live: https://majazaloznik.github.io/sledilnik-data_pipelines/

* v.1.0.0 2020-12-06

## Documentation

https://christophergandrud.github.io/networkD3/#sankey

## Requirements

### R language

eg on MacOS:

```bash
brew install r
```

### R packages

```r
install.packages("networkD3")
install.packages("htmlwidgets")
```

### [Install Pandoc](https://pandoc.org/installing.html), eg on MacOS:

```bash
brew install pandoc
```

## Build

```bash
Rscript code/00-sandbox.R
```
