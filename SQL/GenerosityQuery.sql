CREATE TABLE `capstone-440704.My_Tables.Generosity` AS
SELECT 
    Y2015.Country,
    Y2015.Region,
    Y2015.`Generosity` AS Y2015Generosity,
    Y2016.`Generosity` AS Y2016Generosity,
    Y2017.`Generosity` AS Y2017Generosity,
    Y2018.`Generosity` AS Y2018Generosity,
    Y2019.`Generosity` AS Y2019Generosity,
    /*
    Calculates the average GDP across the five years
    */
    (
        Y2015.`Generosity` + 
        Y2016.`Generosity` + 
        Y2017.`Generosity` + 
        Y2018.`Generosity` + 
        Y2019.`Generosity`
    ) / 5 AS AvgGenerosity
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
    AvgGenerosity DESC;