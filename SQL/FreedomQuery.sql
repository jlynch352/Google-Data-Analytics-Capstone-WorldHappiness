REATE TABLE `capstone-440704.My_Tables.Freedom_Data` AS
SELECT 
    Y2015.Country,
    Y2015.Region,
    Y2015.`Freedom` AS Y2015Freedom,
    Y2016.`Freedom` AS Y2016Freedom,
    Y2017.`Freedom` AS Y2017Freedom,
    Y2018.`Freedom to make life choices` AS Y2018Freedom,
    Y2019.`Freedom to make life choices` AS Y2019Freedom,
    /*
    Calculates the average GDP across the five years
    */
    (
        Y2015.`Freedom` + 
        Y2016.`Freedom` + 
        Y2017.`Freedom` + 
        Y2018.`Freedom to make life choices` + 
        Y2019.`Freedom to make life choices`
    ) / 5 AS AvgFreedom
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
    AvgFreedom DESC;