-- SQL Query: Size Analysis

WITH price_segments AS (
    SELECT 
        property_id,
        city,
        property_type,
        size_sqm,
        sale_price,
        sale_price / size_sqm as price_per_sqm,
        NTILE(4) OVER (PARTITION BY city ORDER BY sale_price) as price_quartile
    FROM properties
    WHERE status = 'Sold' 
        AND size_sqm > 0
        AND sale_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
)
SELECT 
    city,
    property_type,
    price_quartile,
    COUNT(*) as property_count,
    AVG(size_sqm) as avg_size_sqm,
    AVG(sale_price) as avg_sale_price,
    AVG(price_per_sqm) as avg_price_per_sqm,
    MIN(sale_price) as min_price,
    MAX(sale_price) as max_price
FROM price_segments
GROUP BY city, property_type, price_quartile
ORDER BY city, property_type, price_quartile;