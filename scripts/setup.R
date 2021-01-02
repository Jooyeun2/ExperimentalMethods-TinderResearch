#############################################
## The following loads the needed packages ##
#############################################

# load the required packages
packages <- c(
  "here", "readr",# for the project's organization
  "tidyverse", "lubridate", # for wrangling
  "modelr", "broom",
  "dplyr",# for modeling
  "ggrepel", "gghighlight", "patchwork", "maps", # for plotting
  "knitr", "kableExtra", "bookdown", "rmarkdown", # for the report
  "randomForest","janitor","caret","pdftools","rvest","tidytext",
  "stringr","RColorBrewer","printr","ggplot2","topicmodels","text2vec", "DT","ranger", "neuralnet", "Hmisc", "survival","lattice", "bibtext")


######################################################
## The following sets a few option for nice reports ##
######################################################

# general options
options(
  digits = 3,
  str = strOptions(strict.width = "cut"),
  width = 69,
  tibble.width = 69,
  cli.unicode = FALSE
)

# ggplot options
theme_set(theme_light())


######################################################
## The following sets a few option for nice reports ##
######################################################

pval_star <- function (p, cutoffs = c(0.05, 0.01, 0.001)) {
  stopifnot(length(cutoffs) == 3)
  if (length(p) > 1) {
    sapply(p, pval_star, cutoffs = cutoffs)
  }
  else {
    ifelse(p > cutoffs[1], "", ifelse(p > cutoffs[2], 
                                      " *", 
                                      ifelse(p > cutoffs[3], 
                                             " **", 
                                             " ***")))
  }
}

