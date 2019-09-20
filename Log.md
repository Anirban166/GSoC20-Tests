rpois simulation - https://bookdown.org/rdpeng/rprogdatascience/simulation.html

Poisson distribution is commonly used to model data that come in the form of counts. 
> rpois(10, 1)    ## Counts with a mean of 1
 [1] 0 0 1 1 2 1 1 4 1 2
> rpois(10, 2)    ## Counts with a mean of 2
 [1] 4 1 2 0 1 1 0 1 4 1
> rpois(10, 20)   ## Counts with a mean of 20
 [1] 19 19 24 23 22 24 23 20 11 22
---------------------------------------------
Install Rtools to remove warning, run this in console: (C:/rtools)
pkgbuild::find_rtools(debug = TRUE)
---------------------------------------------
install.packages("PeakSegOptimal")
(in console)
(from github:)
if(!require(devtools))install.packages("devtools")
devtools::install_github("tdhock/PeakSegOptimal")
---------------------------------------------
Curve with logarithmic scale - plot log-log scale
Similar to the plot() function, the parameter log sets the logarithmic scale (natural logarithm). log="xy" sets both the axes to log scale. Similarly, log="x" and log="y" set the X and Y axis respectively to the log scale. See the example below where we plot a function y=x2 in the range [1,100] in logarithmic scale for both the axes.
curve( x^2, from=1, to=1000, log = "xy", col="blue", lwd=2 )
---------------------------------------------
https://www.alexejgossmann.com/benchmarking_r/
using microbenchmark:
https://www.r-bloggers.com/using-the-microbenchmark-package-to-compare-the-execution-time-of-r-expressions/
library(microbenchmark)
mbm=microbenchmark(
  function1,
  function2
)
#display mbm:(microbenchmark)
mbm
#plot: using ggplot2 (microbenchmark has an autoplot method available, and note the log scale):
library(ggplot2)
autoplot(mbm)
---------------------------------------------

---------------------------------------------

---------------------------------------------
