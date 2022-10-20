#include <stdio.h>
#include <math.h>
#include <R.h>
#include <Rinternals.h>

void gramc(double *x1p, double *x2p, double *fx, double *c1x, double *c2x)
{
	double x1 = *x1p;
	double x2 = *x2p;
    *fx = x1 + x2;
    *c1x = 1.5 - x1 - 2*x2 - 0.5*sin(2*M_PI*(pow(x1,2)-2*x2));
    *c2x = pow(x1,2) + pow(x2,2) - 1.5;
}


