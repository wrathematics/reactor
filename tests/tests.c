#include "../reactor.h"

SEXP classes(SEXP matrix, SEXP list)
{
  CHECK_IS_MATRIX(matrix);
  CHECK_IS_LIST(list);
  return R_NilValue;
}

SEXP flags(SEXP flag)
{
  CHECK_IS_FLAG(flag);
  return R_NilValue;
}

SEXP strings(SEXP string)
{
  CHECK_IS_STRING(string);
  return R_NilValue;
}

SEXP numbers(SEXP posint)
{
  CHECK_IS_POSINT(posint);
  return R_NilValue;
}
