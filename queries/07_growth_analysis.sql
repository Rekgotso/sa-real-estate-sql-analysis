-- SQL Query: Growth Analysis

SELECT 
    YEAR(sale_date) as sale_year,
    QUARTER(sale_date) as sale_quarter,
    city,
    property_type,
    COUNT(*) as properties_sold,
    AVG(sale_price) as avg_price,
    AVG(sale_price) - LAG(AVG(sale_price)) OVER 
    (
        PARTITION BY city, property_type 
        ORDER BY YEAR(sale_date), QUARTER(sale_date)
    ) as qoq_price_change,
    (AVG(sale_price) - LAG(AVG(sale_price)) OVER (
        PARTITION BY city, property_type 
        ORDER BY YEAR(sale_date), QUARTER(sale_date)
    )) / LAG(AVG(sale_price)) OVER (
        PARTITION BY city, property_type 
        ORDER BY YEAR(sale_date), QUARTER(sale_date)
    ) * 100 as qoq_growth_pct
FROM properties
WHERE status = 'Sold'
GROUP BY YEAR(sale_date), QUARTER(sale_date), city, property_type
ORDER BY sale_year DESC, sale_quarter DESC, city, property_type;