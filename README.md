# reactor

Type tests for R objects in C functions.



## Installation

The "library" is a single header-only C file.  Just copy `reactor.h` to your `src/` directory of your R package source .



## API



The current list of assertions are:

```c
CHECK_IS_MATRIX
CHECK_IS_LIST

CHECK_IS_FLAG
CHECK_IS_STRING

CHECK_IS_INT
CHECK_IS_NATNUM
CHECK_IS_POSINT
```

Each function (really a macro) has a required first argument, and `SEXP` to be checked.  So `CHECK_IS_MATRIX(x)` will see if `x` is a matrix and if not, throw a stop error.  If `x` is not even an SEXP, a compile-time incompatible pointer warning will be produced.

By default, the error message for `CHECK_IS_WHATEVER` will look something like:

```
Error: argument 'x' must be a whatever
```

The argument name (here `x`) will by default be the name of the SEXP object from the calling function.  So the error generated above would have been called by something like:

```c
SEXP somefun(SEXP x){
  CHECK_IS_WHATEVER(x);
  ...
}
```

To change the name printed in the error message, we could change the name of the SEXP object.  However, there is an easier way to handle this.  Each asserter can take an optional second argument (via `__VA_ARGS__` for the curious) as a string, which will change the argument name printed.  For example, this:

```c
CHECK_IS_WHATEVER(x, "this.arg");
```

will produce the following error message:

```
Error: argument 'this.arg' must be a matrix
```



## Examples

The best examples are in the tests for the package.  See `tests/tests.c`.



## Q & A

These are not real questions, but they are real answers.

**Q:** Will this ever be on CRAN?

**A:** Not by itself, no, but feel free to include it in a package.  The project is deliberately small in scope, so you just need to copy it into your existing project if you want to use it; no complicated package linking or anything.


**Q:** What about Rcpp?

**A:** To my knowledge, Rcpp does not offer anything quite like this.  Generally in the Rcpp way of doing things, you have a specified type like `NumericVector` (or with Attributes, an STL type like `vector<double>`), and if you instead pass in the wrong type, like an `IntegerVector`, then an implict copy is produced.


**Q:** Header-only C?

**A:** Absolutely.  Functions are marked `static inline` which allows "multiple" definitions of functions across source files.  This allows inclusion of the header file in multiple places, and the functions will be inlined by any modern compiler with optimization turned on.


**Q:** Why not just check from R?

**A:** This is a fine way to do business.  You can use something like the **assertthat** package (or roll your own).  One problem with this is that checking from R is actually *significantly* slower than checking from C.  Currently it's very trendy in the R community to compare packages with microbenchmarks.  At best these people don't know what they're doing, and at worst they're being outright dishonest.  But **reactor** will improve performance on such benchmarks, if you're into that kind of thing.  Also, and much more importantly, sometimes it's just a lot more convenient to do this stuff in C believe it or not.



## License

**reactor** is licensed under the "0-clause" BSD.  Basically I don't care how or why you use it, but it comes with no warranty of any kind.
