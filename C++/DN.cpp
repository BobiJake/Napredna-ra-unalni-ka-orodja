// DN.cpp : This file contains the 'main' function. Program execution begins and ends there.
//

#include <iostream>
#include <iostream>
#include <cmath>
const double PI = 3.14159265358979323846;
// Funkcija za izračun arctan(x) s Taylorjevo vrsto
double arctan(double x, int n) {
    double result = 0.0;
    for (int i = 0; i < n; ++i) {
        int exponent = 2 * i + 1;
        double term = pow(-1, i) * pow(x, exponent) / exponent;
        result += term;
    }
    return result;
}

// Funkcija za izračun integrala s trapezno metodo
double trapezoidalMethod(double a, double b, int n) {
    double h = (b - a) / n;
    double integral = 0.0;

    for (int i = 0; i <= n; ++i) {
        double xi = a + i * h;
        double fxi = exp(3 * xi) * arctan(xi/2, 100); // 100 približkov za arctan
        integral += (i == 0 || i == n) ? fxi : 2 * fxi;
    }

    integral *= h / 2.0;
    return integral;
}
int main()
{
    double a = 0.0; // spodnja meja integrala
    double b = PI / 4.0; // zgornja meja integrala
    int n = 10000; // število podintervalov

    double result = trapezoidalMethod(a, b, n);

    std::cout << "Priblizna vrednost integrala: " << result << std::endl;

    return 0;
}

