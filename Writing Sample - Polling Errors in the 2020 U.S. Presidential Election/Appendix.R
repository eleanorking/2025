library(tidyverse)
voting_data <- read.csv("~/Downloads/voting2020 - Sheet1.csv")
head(voting_data)

voting_data <- voting_data %>%
  mutate(biden_actual = biden_pct / (biden_pct + trump_pct),
         polling_error_biden = biden_poll - biden_actual)

voting_data <- voting_data %>%
  mutate(margin_biden = biden_pct - trump_pct,
         battleground = if_else(abs(margin_biden) < 5, "Battleground", "Non-Battleground"))

bootstrap <- function(data, n_iterations = 10000) {
  boot_means <- numeric(n_iterations)
  
  for (i in 1:n_iterations) {
    resample <- sample(data, length(data), replace = TRUE)
    boot_means[i] <- mean(resample)
  }
  return(boot_means)
}

battleground_polling_error <- voting_data %>%
  filter(battleground == "Battleground") %>%
  pull(polling_error_biden)

non_battleground_polling_error <- voting_data %>%
  filter(battleground == "Non-Battleground") %>%
  pull(polling_error_biden)

boot_battleground <- bootstrap(battleground_polling_error)
boot_non_battleground <- bootstrap(non_battleground_polling_error)

boot_diff_means <- boot_battleground - boot_non_battleground
conf_interval_diff <- quantile(boot_diff_means, probs = c(0.025, 0.975))
print(conf_interval_diff)

# Distribution of bootstrapped polling errors for battleground vs. non-battleground states
ggplot() +
  geom_histogram(aes(x = boot_battleground), bins = 50, fill = "darkviolet", alpha = 0.7, color = "black") +
  geom_histogram(aes(x = boot_non_battleground), bins = 50, fill = "goldenrod", alpha = 0.7, color = "black") +
  labs(title = "Bootstrapped Polling Error Distributions",
       x = "Bootstrapped Polling Error",
       y = "Frequency") +
  theme_minimal() +
  theme(legend.position = "top") +
  scale_fill_manual(name = "State Type", values = c("darkviolet" = "Battleground", "goldenrod" = "Non-Battleground"))

# Distirbution of difference in means between battleground vs. non-battleground states (confidence interval)
ggplot(data.frame(boot_diff_means), aes(x = boot_diff_means)) +
  geom_histogram(bins = 50, fill = "darkgreen", color = "black", alpha = 0.7) +
  geom_vline(xintercept = mean(boot_diff_means), color = "white", linetype = "dashed") +
  geom_vline(xintercept = conf_interval_diff[1], color = "black", linetype = "solid") +
  geom_vline(xintercept = conf_interval_diff[2], color = "black", linetype = "solid") +
  labs(title = "Bootstrapped Difference in Polling Errors (Battleground vs Non-Battleground)",
       x = "Difference in Mean Polling Errors",
       y = "Frequency") +
  theme_minimal()

##############################
## Bootstrap for State level##
##############################
bootstrap_state_diff <- function(data, n_iterations = 10000) {
  boot_differences <- numeric(n_iterations)
  
  for (i in 1:n_iterations) {
    resample <- sample(data, length(data), replace = TRUE)
    boot_differences[i] <- mean(resample)  # Store the mean difference
  }
  
  return(boot_differences)
}

state_bootstraps <- list()

for (state in battleground_states) {
  state_data <- voting_data %>%
    filter(state == state) %>%
    pull(polling_error_biden)
  
  state_bootstraps[[state]] <- bootstrap_state_diff(state_data)
}

state_results <- data.frame(
  state = rep(battleground_states, each = 10000),
  boot_means = unlist(state_bootstraps)
)

ggplot(state_results, aes(x = boot_means, fill = state)) +
  geom_histogram(binwidth = 0.1, color = "black", alpha = 0.7) +
  facet_wrap(~state, scales = "free", ncol = 3) +
  labs(title = "Bootstrapped Polling Errors for Each Battleground State",
       x = "Polling Error",
       y = "Frequency") +
  theme_minimal()

#######################################
## Bootstrap for SD of polling errors##
#######################################
bootstrap_sd <- function(data, n_iterations = 10000) {
  boot_sds <- numeric(n_iterations)
  
  for (i in 1:n_iterations) {
    resample <- sample(data, length(data), replace = TRUE)
    boot_sds[i] <- sd(resample)
  }
  
  return(boot_sds)
}

battleground_polling_error <- voting_data %>%
  filter(battleground == "Battleground") %>%
  pull(polling_error_biden)

non_battleground_polling_error <- voting_data %>%
  filter(battleground == "Non-Battleground") %>%
  pull(polling_error_biden)

boot_sd_battleground <- bootstrap_sd(battleground_polling_error)
boot_sd_non_battleground <- bootstrap_sd(non_battleground_polling_error)

ggplot() +
  geom_density(aes(x = boot_sd_battleground), fill = "darkviolet", alpha = 0.7) +
  geom_density(aes(x = boot_sd_non_battleground), fill = "goldenrod", alpha = 0.7) +
  labs(title = "Bootstrapped Standard Deviation of Polling Errors",
       x = "Standard Deviation of Polling Error",
       y = "Density") +
  theme_minimal() +
  theme(legend.position = "top") + 
  scale_fill_manual(name = "State Type",
                    values = c("non-swing" = "goldenrod", "swing" = "darkviolet"))
