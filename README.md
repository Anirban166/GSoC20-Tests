Easy Test
---
Package dependencies: PeakSegDP, PeakSegOptimal and tidyverse. <br>
Input: N=10 (lambda/mean for rpois values set to N(L) as well) <br>
(1) Using autoplot: <br>
Case I: Using small dataset sizes: (N,N+10,N+20,N+30)
```
library(PeakSegDP)
library(PeakSegOptimal)
library(ggplot2)
library(microbenchmark)

N <- readline(prompt="Enter size: ")
N <- as.integer(N)

# fits(i) where i is odd pertain to cDPA (quadratic) and where i is even pertain to PDPA (log-linear):
fit1 <- function() cDPA(rpois(N,N), maxSegments=3)
fit2 <- function() PeakSegPDPA(rpois(N,N), max.segments=3L)
fit3 <- function() cDPA(rpois(N+10,N), maxSegments=3)
fit4 <- function() PeakSegPDPA(rpois(N+10,N), max.segments=3L)
fit5 <- function() cDPA(rpois(N+20,N), maxSegments=3)
fit6 <- function() PeakSegPDPA(rpois(N+20,N), max.segments=3L)
fit7 <- function() cDPA(rpois(N+30,N), maxSegments=3)
fit8 <- function() PeakSegPDPA(rpois(N+30,N), max.segments=3L)

# The difference in time is observed at each alternate fit (cDPA>PDPA):
micrograph <- microbenchmark(fit1(),fit2(),fit3(),fit4(),fit5(),fit6(),fit7(),fit8())
autoplot(micrograph,title="PeakSegDP::cDPA (quadratic) vs PeakSegOptimal::PeakSegPDPA (log-linear)")
```
Output plot:
<img src="Images/easytest_autoplot_smallN.png" width="100%">
Microbenchmark computed values:
<img src="Images/microbenchmark_smallset.png" width="75%">
We can infer from the above data that PeakSegPDPA is consuming more time than cDPA (reverse of actual complexity) for small values in the dataset. <br>

Case II: Using large dataset sizes: (N,N+90,N+990,N+9990)
```
library(PeakSegDP)
library(PeakSegOptimal)
library(microbenchmark)
library(ggplot2)

N <- readline(prompt="Enter size: ")
N <- as.integer(N)

fit1 <- function() cDPA(rpois(N,N), maxSegments=3)
fit2 <- function() PeakSegPDPA(rpois(N,N), max.segments=3L)
fit3 <- function() cDPA(rpois(N+90,N), maxSegments=3)
fit4 <- function() PeakSegPDPA(rpois(N+90,N), max.segments=3L)
fit5 <- function() cDPA(rpois(N+990,N), maxSegments=3)
fit6 <- function() PeakSegPDPA(rpois(N+990,N), max.segments=3L)
fit7 <- function() cDPA(rpois(N+9990,N), maxSegments=3)
fit8 <- function() PeakSegPDPA(rpois(N+9990,N), max.segments=3L)

micrograph <- microbenchmark(fit1(),fit2(),fit3(),fit4(),fit5(),fit6(),fit7(),fit8())
autoplot(micrograph,title="PeakSegDP::cDPA (quadratic) vs PeakSegOptimal::PeakSegPDPA (log-linear)")
```
<img src="Images/easytest_autoplot_largeN.png" width="100%">
Microbenchmark computed values:
<img src="Images/microbenchmark_largeset.png" width="75%">
From the data above we can infer that cDPA is consuming more time than PeakSegPDPA (which is expected) for a large values in the dataset. <br>
The observations made above won't be noticeable if we used autoplot and directly jumped into a dataset with possibly more of large values, wherein only the expected trend in time complexity will be shown (and not the initial reverse trend) in the violin plots. <br>

(2) Using ggplot:
```
library(PeakSegDP)
library(PeakSegOptimal)
library(ggplot2)
library(microbenchmark)

N <- readline(prompt="Enter size: ")
N <- as.integer(N)

Nvalues=c(N,N+90,N+990,N+9990)
peaksegpdpa<-integer(length(Nvalues))
cdpa<-integer(length(Nvalues))

# Iterating through N values and computing microbenchmark values:
for (loopvariable in seq(1, length(Nvalues)))
{ x <- rpois(Nvalues[loopvariable], N)
  s <- summary(microbenchmark( PeakSegPDPA(x, rep(1, length(x)), 3L),cDPA(x, rep(1, length(x)), 3L)))
  # Extract the mean from the microbenchmarked values to an array of PeakSegPDPA and cDPA values respectively:
  peaksegpdpa[loopvariable] <- s$mean[1]  
  cdpa[loopvariable] <- s$mean[2]
}
ggplot(data.frame(peaksegpdpa, cdpa, Nvalues), aes(x=Nvalues, y=cdpa)) + geom_line(color = 'red') + geom_line(y = peaksegpdpa, color='blue') + labs(x="N", y="Runtime") + scale_y_continuous(lim=c(0,10000))
# The difference in time is seen by the growth rate in plot (cDPA>PDPA), which at start however has a higher rate for PDPA:
```
Output plot:
<img src="Images/easytest_ggplot.png" width="100%">
It is clear from the plot above that initially for small values of dataset sizes : PDPA>cDPA, then it follows the estimated trend of cDPA>PDPA in terms of runtime complexity. 
Hence we can safely conclude that computation times of PeakSegDP::cDPA follow a greater time complexity (quadratic) as compared to PeakSegOptimal::PeakSegPDPA (log-linear) following the plot(s) obtained. 

Medium Test
---
Function: asymptoticComplexityClass(DF$N, DF$T) 
#N = number of data, T = time in seconds


Hard Test
---
Package name: testComplexity <br>
Function(s): asymptoticComplexityClass <br>
Install using : install.packages("testComplexity") <br>


Documentation: In roxygen format. 
Tests: Not done yet using Rperform.
