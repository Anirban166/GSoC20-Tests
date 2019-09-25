library(PeakSegDP)
library(PeakSegOptimal)
library(microbenchmark)
library(ggplot2)

N <- readline(prompt="Enter size: ")
N <- as.integer(N)

fit1 <- function() cDPA(rpois(N, 30), maxSegments=3)
fit2 <- function() PeakSegPDPA(rpois(N, 30), max.segments=3L)
fit3 <- function() cDPA(rpois(N, 20), maxSegments=3)
fit4 <- function() PeakSegPDPA(rpois(N, 20), max.segments=3L)
fit5 <- function() cDPA(rpois(N+10, 20), maxSegments=3)
fit6 <- function() PeakSegPDPA(rpois(N+10, 20), max.segments=3L)
fit7 <- function() cDPA(rpois(N+10, 30), maxSegments=3)
fit8 <- function() PeakSegPDPA(rpois(N+10, 30), max.segments=3L)

micrograph <- microbenchmark(fit1(),fit2(),fit3(),fit4(),fit5(),fit6(),fit7(),fit8())
testplot <- ggplot(micrograph)
testplot + scale_x_continuous(trans = 'log2') + scale_y_continuous(trans = 'log2')

autoplot(micrograph,title="PeakSegDP::cDPA (quadratic) vs PeakSegOptimal::PeakSegPDPA (log-linear)")

#qplot(micrograph) + scale_y_log10() + scale_x_log10()

#testplot <- ggplot(micrograph)
#testplot + scale_x_continuous(trans = 'log2') + scale_y_continuous(trans = 'log2')
