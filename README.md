# Problem Statement
Price volatility of shallots is an important issue because shallots are one of the most essential ingredients in daily Indonesian cooking. Fluctuations in shallot prices affect not only farmers and sellers, but also consumers and overall food inflation. Understanding price movements in North Sulawesi from 2020 to 2025 can provide insights into market behavior and potential risk factors. 
# Objective
- To analyze shallot price volatility in North Sulawesi from 2020 to 2025 using SQL.
- To analyze the relationship between weather factors and shallot price volatility in North Sulawesi.
# Dataset Overview
The dataset contains daily shallot price data in North Sulawesi from 2020-01-02 to 2025-09-20, consisting of 1,864 rows and 22 columns. The dataset includes price information, time-based features, rolling and lag variables, macroeconomic indicators, and weather data.
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
- Do prices different between days with high and low temperature?
- Do prices different between days with high and low humidity?
- Are there certain seasons where shallot prices are generally higher?
# Project Summary & Key Learnings
- Analyzed shallot price volatility in North Sulawesi using SQL
- Performed data cleaning, validation, and data type conversion
- Identified periods of high price fluctuation
- Learned how missing dates and time-based features affect time series analysis
