# Predicting Car Prices using R and Kaggle Competition


## Project Overview
This project aims to develop a predictive model for car prices to support **Geely Auto**, a Chinese automobile manufacturer, in understanding key pricing factors in the U.S. market. Through insights gained, Geely can refine design, marketing, and strategy for its U.S. market entry.

Our team placed **#2 on the class competition leaderboard on Kaggle**, indicating strong predictive accuracy.

## Project Goals
Geely’s key objectives include:
1. Identifying significant variables affecting car prices.
2. Assessing the predictive power of these variables.
3. Gaining insights on car pricing for strategic decision-making.

## Data Overview
The dataset includes various car attributes and price data:
- **data_dictionary.xlsx**: Variable descriptions.
- **train.csv**: Predictor variables with car prices (for model training).
- **test.csv**: Predictor variables (without prices) for prediction.
- **sample_submission.csv**: Submission format for Kaggle.

## Methodology
1. **Baseline Model**: A linear regression model using basic variables was built initially.
2. **Feature Engineering**: Additional features such as interaction terms (e.g., *hp_weight* = horsepower × curbweight) and polynomial terms (e.g., *enginesize²*) were created to capture non-linear relationships.
3. **Model Selection**: We transitioned from linear regression to a more flexible Random Forest model, which improved the predictive accuracy by capturing complex patterns in the data.

## Key Variables
- **hp_weight**: Interaction between horsepower and curbweight.
- **enginesize²**: Square of engine size to capture non-linear effects.

## Results
Our model performed well, securing **#2 on the Kaggle competition leaderboard**. Key metrics and insights are detailed in the final report.

## Repository Structure
- **data/**: Contains *data_dictionary.xlsx*, *train.csv*, *test.csv*,.
- **software/**: R used for data analysis and model development.
- **report/**: Final report with detailed findings, model insights, and performance metrics.


## Insights for Geely
The analysis suggests that horsepower, curbweight, and engine size significantly impact car prices. These insights can aid in targeting design and market positioning strategies to maximize competitiveness in the U.S. market.

## Contributors
- Surabhi Metpally
- Viktoriia Tkachenko
- Cary Tang  

## License
This project is for educational purposes under the BUS 351 course at NC State.
