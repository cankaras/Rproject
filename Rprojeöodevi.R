# Load the required libraries
library(ggplot2)
library(dplyr)

# Generate an example data set
credit_data <- data.frame(credit_score=rnorm(100, mean=700, sd=50),
                          loan_amount=rnorm(100, mean=15000, sd=3000),
                          loan_approval=rbinom(100, size=1, prob=0.7))

# Clean the data set (if required)
#credit_data_clean <- credit_data %>%
#  drop_na()

credit_data_clean <- credit_data

# Summarize the data
summary(credit_data_clean)

# Visualize the distribution of credit scores
ggplot(credit_data_clean, aes(x=credit_score)) +
  geom_histogram(bins=30, fill="darkblue", color="black") +
  labs(title="Distribution of Credit Scores",
       x="Credit Score",
       y="Frequency")

# Fit a logistic regression model to predict loan approval based on credit score
model <- glm(loan_approval ~ credit_score, data=credit_data_clean, family=binomial)
summary(model)

# Plot the relationship between credit score and loan approval
ggplot(credit_data_clean, aes(x=credit_score, y=loan_approval)) +
  geom_point(size=2, alpha=0.5) +
  geom_smooth(method="glm", method.args=list(family=binomial), se=FALSE, color="red") +
  labs(title="Loan Approval vs Credit Score",
       x="Credit Score",
       y="Loan Approval")



