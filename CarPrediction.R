## Read in the data
train <- read.csv("/Users/surabhimetpally/Downloads/train.csv")
test <- read.csv("/Users/surabhimetpally/Downloads/test.csv")

## Feature Engineering: Adding interaction and polynomial terms
train$hp_weight <- train$horsepower * train$curbweight
train$enginesize2 <- train$enginesize^2
test$hp_weight <- test$horsepower * test$curbweight
test$enginesize2 <- test$enginesize^2

## Estimate model using Random Forest
# Install and load the randomForest package if you haven't already
install.packages("randomForest")

# install.packages("randomForest")
library(randomForest)

set.seed(123) # for reproducibility
rf_model <- randomForest(price ~ carlength + horsepower + curbweight + enginelocation + 
                           wheelbase + carwidth + enginesize + hp_weight + enginesize2,
                         data = train, importance = TRUE, ntree = 500)

## Generate predictions on the test data
predictions <- data.frame(car_ID = test$car_ID, price = predict(rf_model, test))
write.table(predictions, "/Users/surabhimetpally/Downloads/Surabhi2_sample_submission.csv", sep = ",", row.names = FALSE, col.names = TRUE)

## Model summary: Check variable importance
importance(rf_model)

library(ggplot2)

# Consistent theme and color palette
theme_set(theme_minimal())

# Enhanced scatter plot for horsepower vs. price
ggplot(train, aes(x = horsepower, y = price, color = enginelocation)) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(title = "Horsepower vs. Price by Engine Location",
       x = "Horsepower", y = "Price") +
  scale_color_manual(values = c("front" = "blue", "rear" = "red"))

# Box plot for carbody vs. price with custom color palette
ggplot(train, aes(x = carbody, y = price, fill = carbody)) +
  geom_boxplot() +
  labs(title = "Car Body Type vs. Price",
       x = "Car Body Type", y = "Price") +
  scale_fill_brewer(palette = "Set1")

# Scatter plot matrix for key variables
library(GGally)
ggpairs(train[, c("price", "horsepower", "curbweight", "enginesize")])

# Interactive visualization with plotly
library(plotly)
plot_ly(train, x = ~horsepower, y = ~price, color = ~enginelocation,
        type = "scatter", mode = "markers",
        hoverinfo = "text", text = ~paste("Horsepower:", horsepower, "<br>Price:", price))