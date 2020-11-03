#include <stdlib.h> // for NULL
#include <R_ext/Rdynload.h>

/* FIXME:
 Check these declarations against the C/Fortran source code.
 */

/* .C calls */
extern void bbox1c(void *, void *, void *, void *, void *);
extern void bbox2c(void *, void *, void *);
extern void bbox3c(void *, void *, void *);
extern void bbox4c(void *, void *, void *, void *);
extern void bbox5c(void *, void *, void *, void *);
extern void bbox7c(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void gramc(void *, void *, void *, void *, void *);
extern void mtpc(void *, void *, void *, void *);
extern void pressurec(void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void sprinklerc(void *, void *, void *, void *, void *, void *, void *, void *, void *, void *, void *);
extern void tensionc(void *, void *, void *, void *, void *, void *, void *, void *);

static const R_CMethodDef CEntries[] = {
  {"bbox1c",    (DL_FUNC) &bbox1c,     5},
  {"bbox2c",    (DL_FUNC) &bbox2c,     3},
  {"bbox3c",    (DL_FUNC) &bbox3c,     3},
  {"bbox4c",    (DL_FUNC) &bbox4c,     4},
  {"bbox5c",    (DL_FUNC) &bbox5c,     4},
  {"bbox7c",    (DL_FUNC) &bbox7c,    11},
  {"gramc",     (DL_FUNC) &gramc,      5},
  {"mtpc",      (DL_FUNC) &mtpc,       4},
  {"pressurec", (DL_FUNC) &pressurec,  9},
  {"sprinklerc", (DL_FUNC) &sprinklerc, 11},
  {"tensionc",  (DL_FUNC) &tensionc,   8},
  {NULL, NULL, 0}
};

void R_init_CompModels(DllInfo *dll)
{
  R_registerRoutines(dll, CEntries, NULL, NULL, NULL);
  R_useDynamicSymbols(dll, FALSE);
}
