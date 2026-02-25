# Problem Statement
Shallot prices are a key driver of household food expenses in North Sulawesi. Understanding price volatility helps policymakers and producers anticipate price spikes and manage food inflation risk. 
# Objective
- To analyze shallot price volatility in North Sulawesi from 2020 to 2025 using SQL.
- To analyze the relationship between weather factors and shallot price volatility in North Sulawesi.
# Dataset Overview
The dataset contains daily shallot price data in North Sulawesi from 2020-01-02 to 2025-09-20, consisting of 1,864 rows and 22 columns. The dataset includes: 
- price information,
- time-based features (date, month, weekday),
- rolling averages (short-term price fluctuations),
- lag variables (past prices),
- macroeconomic indicators (CPI, USD/IDR),
- weather data (temperature, rainfall, humidity).
# Data Understanding
- Prices (target)
Represents the daily market price of bawang merah in North Sulawesi and is the main variable analyzed.
- Time columns (date, month, weekday)
The dataset is daily, but some dates are missing, likely due to non-trading days.
- Rolling means
Rolling averages smooth short-term price fluctuations to reveal trends. Null values occur when insufficient historical data exists.
- Lag features
Lag features represent past prices and help capture short-term price dependency.
- Macro variables (CPI, USD/IDR)
CPI and exchange rate may influence food prices through inflation and import costs.
- Weather variables
Weather variables may affect supply conditions and price volatility.
# Business Questions
- How did the average shallot price change over time from 2020 to 2025?
- What were the highest and lowest daily price changes?
- Do prices different between days with high and low rainfall?
- Are there certain seasons where shallot prices are generally higher?
# Project Summary & Key Learnings
- Analyzed shallot price volatility in North Sulawesi using SQL
- Performed data cleaning, validation, and data type conversion
- Identified periods of high volatility, seasonal price patterns, and mild weather-related price differences
- Learned how missing dates and time-based features affect time series analysis
