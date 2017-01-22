dyn.load("bench.so")

cfun <- function(x) .Call("cfun", x, PACKAGE="bench")
rfun <- function(x)
{
  is.badval <- function(x) is.na(x) || is.nan(x) || is.infinite(x)
  is.inty <- function(x) abs(x - round(x)) < 1e-10
  is.zero <- function(x) abs(x) < 1e-10
  is.negative <- function(x) x < 0
  is.annoying <- function(x) length(x) != 1 || is.badval(x)
  
  if (!is.numeric(x) || is.annoying(x) || !is.inty(x) || is.negative(x) || is.zero(x))
    stop("argument 'x' must be a positive integer")
  
  NULL
}

library(microbenchmark)
microbenchmark(cfun(1L), rfun(1L))

library(compiler)
cfun_c <- cmpfun(cfun)
rfun_c <- cmpfun(rfun)
microbenchmark(cfun_c(1L), rfun_c(1L))
