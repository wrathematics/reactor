dyn.load("tests.so")

matrix <- matrix()
list <- list()

flag <- TRUE
string <- "test"
posint <- 1L
posinty <- 1.0


# warning, not giving enough args will segfault, ~YOLO~
funner <- function(fun)
{
  function(...) invisible(tryCatch(.Call(fun, ...), error=identity))
}

classes <- funner("classes")
flags <- funner("flags")
strings <- funner("strings")
numbers <- funner("numbers")

checker <- function(err, pattern) stopifnot(ifelse(missing(pattern), is.null(err), grepl(err$message, pattern=pattern)))

checker(classes(matrix, list))
checker(classes(NA, list), "a matrix")
checker(classes(matrix, NA), "a list")

checker(flags(flag))
checker(flags(NA), "a flag")

checker(strings(string))
checker(strings(NA), "character string")

checker(numbers(posint))
checker(numbers(posinty))
checker(numbers(NA), "positive integer")
