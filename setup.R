# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~  Shiny for Production  ~~
# ~~    EARL London 2019    ~~
# ~~          ~~~           ~~
# ~~      Setup notes       ~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# /===============\
# ===== Check =====
# \===============/

# Use this section to double-check that you have all the necessary packages for
# the workshop. Anything missing can be installed in the following section.


# Check whether all required R packages are installed (a list of any missing
# packages is printed)
pkgs <- c("shiny", "readr", "dplyr", "ggplot2", "broom", "profvis", "feather", "shinyloadtest", "shinytest")
pkgs[which(!(pkgs %in% installed.packages()))]


# Check Java installation. This should return a version string, e.g. "java
# version "1.8.0_221"; if instead you see "java: command not found" or similar,
# please check your Java installation. You may need to restart RStudio if you
# have just installed or reinstalled Java.
system("java -version")



# /=================\
# ===== Install =====
# \=================/

# Apps
install.packages(c("shiny", "readr", "dplyr", "ggplot2", "broom"))


# Profiling and streamlining
install.packages(c("profvis", "feather"))


# Loadtesting (shinyloadtest isn't on CRAN)
install.packages("remotes")
remotes::install_github("rstudio/shinyloadtest")

# Additionally, Java must be installed...
# https://www.java.com/en/download/
# ... and the shinycannon_____.jar executable file must be downloaded. It is
# already present in this repository, but can be found here if needed:
# https://rstudio.github.io/shinyloadtest/#shinycannon


# Testing
install.packages("shinytest")

