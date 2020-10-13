#include <stdio.h>
#include <math.h>
#include <R.h>
#include <Rinternals.h>

void mtpc(double *x1p, double *x2p, double *fx, double *c1x)
{
	double x1 = *x1p;
	double x2 = *x2p;
    double t;
    t = atan2(x1,x2);
    *fx = -pow((cos((x1-.1)*x2)),2) - x1*sin(3*x1+x2);
    *c1x = pow(x1,2) + pow(x2,2) - pow(2*cos(t)-.5*cos(2*t)-.25*cos(3*t)-.125*cos(4*t),2) - pow(2*sin(t),2);
}



