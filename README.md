# reactor

Type tests for R objects in C functions.



## Installation

The "library" is a single header-only C file.  Just copy `reactor.h` to your `src/` directory of your R package source .



## API

TODO



## Q & A

These are not real questions, but they are real answers.

**Q:** Will this ever be on CRAN?

**A:** Not by itself, no, but feel free to include it in a package.  The project is deliberately small in scope, so you just need to copy it into your existing project if you want to use it; no complicated package linking or anything.


**Q:** What about Rcpp?

**A:** To my knowledge, Rcpp does not offer anything quite like this.  Generally in the Rcpp way of doing things, you have a specified type like `NumericVector` (or with Attributes, an STL type like `vector<double>`), and if you instead pass in the wrong type, like an `IntegerVector`, then an implict copy is produced.


**Q:** Header-only C?

**A:** Absolutely.  Functions are marked `static inline` which allows "multiple" definitions of functions across source files.  This allows inclusion of the header file in multiple places, and the functions will be inlined by any modern compiler with optimization turned on.


**Q:** Why not just check from R?

**A:** This is a fine way to do business.  You can use something like the assertthat package (or roll your own).  One problem with this is that checking from R is actually *significantly* slower than checking from C.  Currently it's very trendy in the R community to compare packages with microbenchmarks.  At best these people don't know what they're doing, and at worst they're being outright dishonest.  But reactor will improve performance on such benchmarks.  Also, sometimes it's just a lot more convenient to do this stuff in C believe it or not.



## License

reactor is licensed under the "0-clause" BSD.  Basically I don't care how or why you use it, but it comes with no warranty of any kind.
