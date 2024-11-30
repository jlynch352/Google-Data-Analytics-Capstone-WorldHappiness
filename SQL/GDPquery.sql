CREATE TABLE `capstone-440704.My_Tables.GDP_Data` AS
SELECT 
    Y2015.Country,
    Y2015.Region,
    Y2015.`Economy GDP per Capita` AS Y2015avgGDP,
    Y2016.`Economy GDP per Capita` AS Y2016avgGDP,
    Y2017.`Economy_GDP_per_Capita` AS Y2017avgGDP,
    Y2018.`Economy GDP per Capita` AS Y2018avgGDP,
    Y2019.`GDP per capita` AS Y2019avgGDP,
    /*
    Calculates the average GDP across the five years
    */
    (
        Y2015.`Economy GDP per Capita` + 
        Y2016.`Economy GDP per Capita` + 
        Y2017.`Economy_GDP_per_Capita` + 
        Y2018.`Economy GDP per Capita` + 
        Y2019.`GDP per capita`
    ) / 5 AS AvgGDP
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
    AvgGDP DESC;