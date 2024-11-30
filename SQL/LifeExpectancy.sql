CREATE TABLE `capstone-440704.My_Tables.Family_Health life expectancy` AS
SELECT 
    Y2015.Country,
    Y2015.Region,
    Y2015.`Health Life Expectancy` AS Y2015HLE,
    Y2016.`Health Life Expectancy` AS Y2016HLE,
    Y2017.`Health Life Expectancy` AS Y2017HLE,
    Y2018.`Healthy life expectancy` AS Y2018HLE,
    Y2019.`Healthy life expectancy` AS Y2019HLE,
    /*
    Calculates the average GDP across the five years
    */
    (
        Y2015.`Health Life Expectancy` + 
        Y2016.`Health Life Expectancy` + 
        Y2017.`Health Life Expectancy` + 
        Y2018.`Healthy life expectancy` + 
        Y2019.`Healthy life expectancy`
    ) / 5 AS AvgFamily
FROM 
    `capstone-440704.WorldHappinessReport.2015_Data` AS Y2015 
JOIN 
    `capstone-440704.WorldHappinessReport.2016_data` AS Y2016 
    ON Y2015.Country = Y2016.Country
JOIN 
    `capstone-440704.WorldHappinessReport.2017_data` AS Y2017  
    ON Y2015.Country = Y2017.Country
JOIN 
    `capstone-440704.WorldHappinessReport.2018_Data` AS Y2018
    ON Y2015.Country = Y2018.`Country or region`
JOIN 
    `capstone-440704.WorldHappinessReport.2019_Data` AS Y2019
    ON Y2015.Country = Y2019.`Country or region`
ORDER BY
    AvgFamily DESC;