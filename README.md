# MATLAB ODE Solution Plotter

## Overview

This repository contains a MATLAB function `plot_ODE_solution_with_initial_conditions` that provides an interactive graphical user interface (GUI) for plotting the solution of a second-order ordinary differential equation (ODE) specifically, to model damping of waves with user-defined initial conditions and parameters. The GUI allows users to specify parameters and initial conditions, then visualize the resulting solution.

## Features

- Interactive GUI for inputting parameters and initial conditions for waves.
- Plots the solution of the ODE in real-time based on user inputs.
- Handles different cases of the ODE based on the discriminant.

## Functionality

The `plot_ODE_solution_with_initial_conditions` function creates a UI window with the following components:
- Numeric input fields for parameters $\( b \)$ and $\( w \)$, and initial conditions $\( x(0) \)$ and $\( \frac{dx}{dt}(0) \)$.
- A button to update the plot based on the current parameter values and initial conditions.

### ODE Solution

The function solves the second-order ODE:

$\[ \frac{d^2x}{dt^2} + 2b\frac{dx}{dt} + w^2 x = 0 \]$

with the given initial conditions. It handles three cases:
1. **Overdamped**: When the discriminant $\( b^2 - w^2 \)$ is positive.
2. **Critically damped**: When the discriminant is zero.
3. **Underdamped**: When the discriminant is negative.

## Usage

1. **Run the Function**
   - Open MATLAB and navigate to the directory containing the script.
   - Run the function:
     ```matlab
     plot_ODE_solution_with_initial_conditions
     ```

2. **Interact with the GUI**
   - Adjust the values in the numeric input fields for parameters $\( b \)$, $\( w \)$, and initial conditions $\( x(0) \)$ and $\( \frac{dx}{dt}(0) \)$.
   - Click the **Update Plot** button to generate and view the plot of the ODE solution.

Contact

For questions or issues, please contact:

  Mayank Wangikar
  wangikarmayank@gmail.com
  [My Website]([https://website-name.com](https://mayank-wangikar.github.io/mayankwangikar.github.io/))
