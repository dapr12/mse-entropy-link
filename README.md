# MSE-Entropy Relationship: An Explanatory Overview

This repository explores the theoretical and practical connections between Mean Squared Error (MSE), a common metric for evaluating regression models, and entropy, a concept from information theory measuring uncertainty. The primary focus is on understanding how reducing uncertainty (lowering conditional entropy) relates to improving prediction accuracy (lowering MSE), particularly in the context of Ordinary Least Squares (OLS) regression.

The materials are inspired by and conceptually aligned with frameworks discussed in papers such as:
*   Olsen, W., Pérez Ruiz, D. A., & Wiśniowski, A. (2022). *Children's Work and Child Labour: Prevalence Rates and The Importance of Plural Causality.*  

## Repository Contents

1.  **`MSE_Entropy_Explanation.pdf`**: A pdf document providing a detailed explanation of the MSE-entropy link.
    *   Starts with the univariate (single predictor) case.
    *   Extends to the multivariate (multiple predictors) case, focusing on general OLS regression.
    *   Discusses the key formula $\text{MSE} = \frac{1}{2\pi e} \exp\{2H(\text{residuals})\}$ for normally distributed residuals.
    *   Contrasts the general OLS MSE with more specialized MSE formulas found in research literature that may incorporate predictor characteristics directly.
2.  **`R_Simulations/`**: A directory containing R scripts for demonstrating these concepts.
    *   **`mse_entropy_ols_simulation.R`**: An R script that simulates data for both univariate and multivariate OLS regression.
        *   Calculates the OLS MSE directly from model residuals.
        *   Calculates the entropy of these residuals (assuming normality and using the OLS MSE as the error variance).
        *   Demonstrates the identity $\text{MSE}_{\text{OLS}} = \frac{1}{2\pi e} \exp\{2 \hat{H}(\text{residuals}_{\text{OLS}})\}$ by showing that the MSE calculated via the entropy formula matches the directly calculated OLS MSE.
        *   This script focuses on the *general OLS MSE* and its link to residual entropy, confirming the consistency across univariate and multivariate OLS.

## Core Concepts Explored

*   **Mean Squared Error (MSE):** Definition and calculation for OLS regression.
*   **Entropy:** Basic definitions (entropy, conditional entropy, mutual information).
*   **Conditional Entropy $H(Y|\mathbf{X})$:** Its role as a measure of remaining uncertainty.
*   **Link for Normal Errors:** The specific mathematical relationship $\text{MSE} = \frac{1}{2\pi e} \exp\{2H(\epsilon)\}$ when errors $\epsilon$ are normally distributed with variance MSE.
*   **Univariate vs. Multivariate OLS:** Demonstrating that the fundamental OLS MSE definition and its link to normal residual entropy are structurally the same, regardless of the number of predictors.
*   **Distinction from Specialized MSE Formulas:** Highlighting that specific MSE formulas found in research (e.g., those in Olsen et al. that might directly include predictor variances or complex correlation structures) often pertain to different underlying theoretical models or assumptions beyond standard OLS.

## How to Use


### R Simulation Script

1.  **Prerequisites:**
    *   R installed on your system.
    *   RStudio (recommended) or any R-compatible IDE/text editor.
    *   The `MASS` R package. If not installed, run `install.packages("MASS")` in your R console.
2.  **Running the Script:**
    *   Open the `R_Simulations/mse_entropy_ols_simulation.R` script in RStudio or your preferred R environment.
    *   Execute the script (e.g., by clicking "Source" in RStudio or using `source("R_Simulations/mse_entropy_ols_simulation.R")` in the R console after navigating to the project's root directory).
3.  **Output:**
    *   The script will print output to the R console, showing:
        *   Simulated data parameters.
        *   OLS MSE calculated directly from model residuals for both univariate and multivariate cases.
        *   Estimated entropy of these residuals.
        *   OLS MSE "re-calculated" using the entropy formula, demonstrating the identity.


## Contributions

Feel free to fork this repository, suggest improvements, or open issues if you find any discrepancies or have questions.

## License

[Specify a license if you wish, e.g., MIT, Apache 2.0, or leave it as is if it's for personal/educational use without explicit licensing.]
