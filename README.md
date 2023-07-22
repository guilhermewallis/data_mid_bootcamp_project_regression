# Real Estate Price Prediction

<img src="https://images.unsplash.com/photo-1592595896551-12b371d546d5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2670&q=80" width = 800 alt="" title="" />


## Project Objective

This project is focused on comprehending the influential factors driving real estate prices, and utilizing Machine Learning algorithms for price prediction. Part of the Ironhack Mid-term Bootcamp, our project delves into a dataset of 22,000 properties transacted between May 2014 and May 2015 in King County, WA.

## Dataset
- The dataset consists of information on 22,000 properties. 
- The dataset consists of historic data of houses sold between May 2014 to May 2015 in King County WA.
- These are the definitions of data points provided:

| Column Name   | Description                                                                 |
| ------------- | --------------------------------------------------------------------------- |
| id            | ID of the house                                                             |
| date          | Date the house was sold                                                     |
| bedrooms      | Number of bedrooms                                                          |
| bathrooms     | Number of bathrooms                                                         |
| sqft_living   | Square footage of the home                                                   |
| sqft_lot      | Square footage of the lot                                                   |
| floors        | Total floors in the house                                                   |
| waterfront    | House which has a view to a waterfront                                      |
| view          | Has been viewed                                                             |
| condition     | How good the condition is overall                                           |
| grade         | Overall grade given to the housing unit, based on King County grading system|
| sqft_above    | Square footage of house apart from basement                                 |
| sqft_basement | Square footage of the basement                                              |
| yr_built      | Built Year                                                                  |
| yr_renovated  | Year when the house was renovated                                           |
| zipcode       | Zip code                                                                    |
| lat           | Latitude coordinate                                                         |
| long          | Longitude coordinate                                                        |
| sqft_living15 | Living room area in 2015 (implies-- some renovations)                       |
| sqft_lot15    | Lot size area in 2015 (implies-- some renovations)                          |
| price         | Price of the house                                                          |
| district      | District where the house is located                                         |

## Tools Employed
- **Visualization**: Tableau
- **Exploratory Data Analysis (EDA)**: MySQL, Python (Jupyter Notebook)
- **Machine Learning**: Python (Jupyter Notebook) utilizing Linear Regression, KNN Regressor, and Random Forest Regressor

## Project Structure:

1. **Import Libraries & Load Dataset**: Initialization of the data exploration and analysis journey.
2. **Dataset Overview**: A quick look into the data attributes.
3. **Data Cleaning**: Ensuring data quality and integrity.
4. **Exploratory Data Analysis (EDA)**: Delving deeper into the data to reveal insights.
5. **Data Modeling**: Building models via Linear Regression, KNN Regressor, and Random Forest Regressor.
6. **Model Evaluation**: Rigorous cross-examination of the developed models.
7. **Feature Importance Analysis**: Determining key price influencers.
8. **Conclusio**n: Summarizing findings and recommending future work.


## Conclusion
- The RandomForestRegressor emerged as the top-performing model across various data preprocessing techniques such as standard scaling and log transformation.

- Features like grade, lat, and sqft_living were found to significantly influence the price, with the grade reflecting the house's quality, lat representing the location, and sqft_living indicating the house size.

- It is recommended to consider additional social factors like transportation, education, and crime rates for a more comprehensive price prediction.

Please find more detailed insights and methodology in the Jupyter Notebooks provided.


### Helpful resources to view
- [Slide Deck](https://docs.google.com/presentation/d/1gG1il8EGC39G50ztC2TZIKI9QXYdoRPitgs7tb67Qc4/edit?usp=sharing): For a comprehensive overview of our project.

- [Tableau Dashboard](https://public.tableau.com/app/profile/guilherme.carvalho5990/viz/data_mid_bootcamp_project_regression_tb/Dashboard1?publish=yes): Engage with our visually pleasing interactive dashboard and delve into the King County real estate market.
  
- [King County Website](https://info.kingcounty.gov/assessor/esales/Glossary.aspx?type=r): Our primary dataset source. Visit for more specific insights into the property market.




