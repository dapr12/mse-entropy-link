# -----------------------------------------------------------------------------
# R Code: MSE and Entropy Examples (Univariate and Multivariate)
# Based on theoretical concepts from Olsen, Pérez Ruiz, and Wiśniowski
# -----------------------------------------------------------------------------

# Clear workspace
rm(list = ls(all = TRUE))

# -----------------------------------------------------------------------------
# R Code: MSE and Entropy Examples (Univariate and Multivariate OLS)
# Focusing on General OLS MSE and its link to residual entropy
# -----------------------------------------------------------------------------

# Install and load necessary packages
# install.packages(c("MASS", "dplyr")) # Run once if not installed

library(MASS)     # For mvrnorm (multivariate normal simulation)
# library(dplyr)    # Not strictly needed for this revised version

# --- Part 1: Univariate Case Example ---

cat("--- Starting Univariate Case ---\n\n")

# 1.1. Simulate Data
set.seed(123) # for reproducibility

n_samples_uni <- 1000
true_slope_uni <- 2
true_intercept_uni <- 5
sigma_epsilon_true_uni <- 1.5 # True standard deviation of the error

X_uni <- rnorm(n_samples_uni, mean = 10, sd = 3)
epsilon_uni <- rnorm(n_samples_uni, mean = 0, sd = sigma_epsilon_true_uni)
Y_uni <- true_intercept_uni + true_slope_uni * X_uni + epsilon_uni
data_uni <- data.frame(X = X_uni, Y = Y_uni)

# 1.2. Fit a Linear Model and Get OLS MSE
cat("Fitting Univariate Linear Model (Y ~ X)...\n")
lm_uni <- lm(Y ~ X, data = data_uni)
residuals_uni <- residuals(lm_uni)
mse_ols_uni <- mean(residuals_uni^2)
cat("OLS MSE from lm() model (Univariate):", mse_ols_uni, "\n")
cat("True error variance (sigma_epsilon_true_uni^2):", sigma_epsilon_true_uni^2, "\n")

# 1.3. Calculate OLS MSE from Entropy of Residuals (Assuming Normal Residuals)
# H(residuals) = 0.5 * log(2 * pi * e * MSE_OLS)
sigma_sq_for_entropy_uni <- mse_ols_uni
H_residuals_uni <- 0.5 * log(2 * pi * exp(1) * sigma_sq_for_entropy_uni)
cat("Estimated H(residuals) based on OLS MSE (Univariate):", H_residuals_uni, "\n")

# MSE_OLS = (1 / (2 * pi * e)) * exp(2 * H_residuals)
mse_from_entropy_uni <- (1 / (2 * pi * exp(1))) * exp(2 * H_residuals_uni)
cat("OLS MSE calculated from H(residuals) (Univariate):", mse_from_entropy_uni, "\n")

cat("\n--- Univariate OLS Comparison Summary ---\n")
cat("OLS MSE directly from lm() model residuals:", format(mse_ols_uni, digits = 7), "\n")
cat("OLS MSE calculated from entropy of residuals:", format(mse_from_entropy_uni, digits = 7), "\n")
cat("(Expect these two MSEs to be virtually identical due to formula reversal)\n")

cat("\n--- End of Univariate Case ---\n\n\n")


# --- Part 2: Multivariate Case Example (2 predictors) ---

cat("--- Starting Multivariate Case (Focus on General OLS MSE) ---\n\n")

# 2.1. Simulate Data
set.seed(456) # for reproducibility
n_samples_multi <- 1000

true_intercept_multi <- 3
true_beta1_multi <- 1.5
true_beta2_multi <- -0.8
sigma_epsilon_true_multi <- 1.2 # True std dev of the error in the full model

mean_X_multi <- c(5, 12)
sigma_X1_true <- 2
sigma_X2_true <- 4
rho_X1X2_true <- 0.6

cov_X1X2_true <- rho_X1X2_true * sigma_X1_true * sigma_X2_true
cov_matrix_X_true <- matrix(c(sigma_X1_true^2,   cov_X1X2_true,
                              cov_X1X2_true,     sigma_X2_true^2),
                            nrow = 2)

X_multi_predictors <- mvrnorm(n_samples_multi, mu = mean_X_multi, Sigma = cov_matrix_X_true)
X1_multi <- X_multi_predictors[,1]
X2_multi <- X_multi_predictors[,2]

epsilon_multi <- rnorm(n_samples_multi, mean = 0, sd = sigma_epsilon_true_multi)
Y_multi <- true_intercept_multi + true_beta1_multi * X1_multi + true_beta2_multi * X2_multi + epsilon_multi
data_multi <- data.frame(X1 = X1_multi, X2 = X2_multi, Y = Y_multi)

# 2.2. Fit a Linear Model and Get OLS MSE
cat("Fitting Multivariate Linear Model (Y ~ X1 + X2)...\n")
lm_multi <- lm(Y ~ X1 + X2, data = data_multi)
residuals_multi <- residuals(lm_multi)
mse_ols_multi <- mean(residuals_multi^2)
cat("OLS MSE from lm() model (Y ~ X1 + X2):", mse_ols_multi, "\n")
cat("True error variance for this model (sigma_epsilon_true_multi^2):", sigma_epsilon_true_multi^2, "\n")

# 2.3. Calculate OLS MSE from Entropy of Residuals (Assuming Normal Residuals)
# This demonstrates the generic OLS MSE - H(residuals) link
cat("\n--- Multivariate: OLS MSE and H(residuals) Link ---\n")
sigma_sq_for_entropy_multi <- mse_ols_multi
H_residuals_multi <- 0.5 * log(2 * pi * exp(1) * sigma_sq_for_entropy_multi)
cat("Estimated H(residuals) based on OLS MSE (Multivariate):", H_residuals_multi, "\n")

mse_from_entropy_generic_multi <- (1 / (2 * pi * exp(1))) * exp(2 * H_residuals_multi)
cat("OLS MSE calculated from H(residuals) (Multivariate):", mse_from_entropy_generic_multi, "\n")

cat("\n--- Multivariate OLS Comparison Summary ---\n")
cat("OLS MSE directly from lm() model residuals:", format(mse_ols_multi, digits = 7), "\n")
cat("OLS MSE calculated from entropy of residuals:", format(mse_from_entropy_generic_multi, digits = 7), "\n")
cat("(Expect these two MSEs to be virtually identical due to formula reversal, same as univariate case)\n")

cat("\n--- End of Multivariate Case ---\n\n")
