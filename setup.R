# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# ~~  Shiny for Production  ~~
# ~~    EARL London 2019    ~~
# ~~          ~~~           ~~
# ~~      Setup notes       ~~
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~


# /==============\
# ===== Data =====
# \==============/

# Download the data needed for the workshop
download.file("http://stat-computing.org/dataexpo/2009/2008.csv.bz2", "data/flights08.csv")
download.file("http://stat-computing.org/dataexpo/2009/airports.csv", "data/airports.csv")



# /===============\
# ===== Check =====
# \===============/

# Use this section to double-check that you have all the necessary dependencies
# for the workshop. Anything missing can be installed in the following section.


# Check whether all required R packages are installed (a list of any missing
# packages is printed)
pkgs <- c("shiny", "readr", "dplyr", "ggplot2", "broom", "profvis", "feather", "shinyloadtest", "shinytest")
pkgs[which(!(pkgs %in% installed.packages()))]


# Once shinytest is installed, check dependencies: if FALSE, install in next section.
shinytest::dependenciesInstalled()


# As well as shinyloadtest, we need the shinycannon tool for loadtesting

# Windows:
#   Check Java installation. This should return a version string, e.g. "java
#   version "1.8.0_221"; if instead you see "java: command not found" or similar,
#   please check your Java installation. You may need to restart RStudio if you
#   have just installed or reinstalled Java.
system("java -version")

# Linux/Mac: Make sure you have installed shinycannon according to instructions
# in the next section
system("shinycannon -h")



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

# Additionally, on Windows and Mac, Java must be installed...
# https://www.java.com/en/download/
# ... and on all operating systems, shinycannon must be downloaded or installed.
# For Windows, the shinycannon_____.jar executable file must be downloaded. It is
# already present in this repository, but can be found here if needed:
# https://rstudio.github.io/shinyloadtest/#shinycannon
# Instructions for other operating systems can also be found at that link.


# Testing
install.packages("shinytest")
shinytest::installDependencies()

