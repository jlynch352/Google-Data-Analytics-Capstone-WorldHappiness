CREATE TABLE `capstone-440704.My_Tables.Family_Data` AS
SELECT 
    Y2015.Country,
    Y2015.Region,
    Y2015.`Family` AS Y2015Family,
    Y2016.`Family` AS Y2016Family,
    Y2017.`Family` AS Y2017Family,
    Y2018.`Social support` AS Y2018Family,
    Y2019.`Social support` AS Y2019Family,
    /*
    Calculates the average GDP across the five years
    */
    (
        Y2015.`Family` + 
        Y2016.`Family` + 
        Y2017.`Family` + 
        Y2018.`Social support` + 
        Y2019.`Social support`
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