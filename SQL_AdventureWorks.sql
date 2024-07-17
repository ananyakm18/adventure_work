use adventureworks;
select *from adsales;
select *from adcustomer;
select *from adproduct;

 #USING ORDERDATEKEY   
SELECT 
    Orderdatekey AS OrderDate,
    YEAR(Orderdatekey) AS Year,
    MONTH(Orderdatekey) AS Month,
    MONTHNAME(orderdatekey) AS FullMonthName,
    QUARTER(Orderdatekey) AS Quarter,
    DAY(Orderdatekey) AS Day,
    WEEKDAY(Orderdatekey) AS Weekday,
    DAYNAME(orderdatekey) AS weekdayname
FROM
    adsales;
    
    #YEAR WISE SALES  
    SELECT 
    YEAR(orderdatekey) AS order_year,
    ROUND(SUM(salesamount), 4) AS totalsales
FROM
    adsales
GROUP BY order_year
ORDER BY order_year;
    
    
#Month wise sales
     SELECT 
    MONTH(orderdatekey) AS order_month,
    MONTHNAME(orderdatekey) AS monthname,
    ROUND(SUM(salesamount), 4) AS totalsales
FROM
    adsales
GROUP BY order_month , monthname;
    
    
#Quarter wise sales
    SELECT 
    QUARTER(orderdatekey) AS quarter,
    ROUND(SUM(salesamount), 4) AS totalsales
FROM
    adsales
GROUP BY quarter;
    
    
    
    
  #REGION SALES  
    SELECT 
    region, round(SUM(salesamount),4) AS TotalSales
FROM
    adsales
GROUP BY region;


#REGION PRODUCTION
SELECT 
    region, round(SUM(totalproductcost),4) AS productcost
FROM
    adsales
GROUP BY region;


#PROFIT OF EACH PRODUCT
SELECT 
    PRODUCTNAME,
    ROUND(SUM(SALESAMOUNT - TOTALPRODUCTCOST - FREIGHT - TAXAMT),
            2) AS PROFIT
FROM
    ADSALES
GROUP BY PRODUCTNAME
ORDER BY PROFIT DESC
;

#REVENUE,PROFIT,UNITS OF EACH PRODUCT
SELECT
    productname,
 round(SUM(salesamount),4) AS total_sales_revenue,
   round( SUM(SALESAMOUNT - TOTALPRODUCTCOST - FREIGHT - TAXAMT),4) AS total_profit,
   round( SUM(salesamount/unitprice),4) AS total_units_sold
FROM
    adsales
GROUP BY
    productname;
    


#TOP 5 MOST ORDERED
SELECT 
    productname,
    SUM(orderquantity) AS TotalorderQuantity
FROM 
    adsales
GROUP BY 
    productkey,
    productname
ORDER BY 
    TotalorderQuantity DESC
LIMIT 5;
  
  
  #SALES
  SELECT ROUND(SUM(SALESAMOUNT),4)AS TOTALSALES FROM ADSALES;
  
  #PROFIT
  SELECT round( SUM(SALESAMOUNT - TOTALPRODUCTCOST - FREIGHT - TAXAMT),4) AS total_profit FROM ADSALES;
  
  #UNIT SOLD
  SELECT  round( SUM(salesamount/unitprice),4) AS total_units_sold FROM ADSALES;

SELECT SALESAMOUNT ,(ORDERQUANTITY*UNITPRICE)AS PRODUCTION FROM ADSALES GROUP BY SALESAMOUNT,PRODUCTION;
    
#customeranalysis
#CUSTOMER YEARLY INCOME
SELECT 
    CONCAT(FIRSTNAME,
            ' ',
            MIDDLENAME,
            ' ',
            LASTNAME,
            ' ') AS CUSTOMER_NAME,
    YEARLYINCOME
FROM
    ADCUSTOMER
ORDER BY YEARLYINCOME DESC;

#GENDER
SELECT 
    c.gender,
    round(SUM(s.salesamount),4) AS TotalSales
FROM 
    adsales s
JOIN 
    adcustomer c ON s.customerkey = c.customerkey
GROUP BY 
    c.gender;

