#include "../reactor.h"

SEXP cfun(SEXP x)
{
  CHECK_IS_POSINT(x);
  return R_NilValue;
}
