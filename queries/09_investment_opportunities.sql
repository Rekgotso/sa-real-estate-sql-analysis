-- SQL Query: Investment Opportunities

WITH neighborhood_avg AS (
    SELECT 
        city,
        property_type,
        AVG(sale_price / size_sqm) as avg_price_per_sqm
    FROM properties
    WHERE status = 'Sold'
        AND sale_date >= DATE_SUB(CURDATE(), INTERVAL 6 MONTH)
    GROUP BY city, property_type
)
SELECT 
    p.property_id,
    p.address,
    p.city,
    p.property_type,
    p.listing_price,
    p.size_sqm,
    p.listing_price / p.size_sqm as listing_price_per_sqm,
    na.avg_price_per_sqm as market_avg_per_sqm,
    ((p.listing_price / p.size_sqm) - na.avg_price_per_sqm) / na.avg_price_per_sqm * 100 as price_vs_market_pct,
    p.bedrooms,
    p.bathrooms,
    DATEDIFF(CURDATE(), p.listing_date) as days_on_market
FROM properties p
JOIN neighborhood_avg na ON p.city = na.city AND p.property_type = na.property_type
WHERE p.status = 'Listed'
    AND (p.listing_price / p.size_sqm) < (na.avg_price_per_sqm * 0.85) -- 15% below market
    AND p.size_sqm > 50
ORDER BY price_vs_market_pct ASC
LIMIT 50;