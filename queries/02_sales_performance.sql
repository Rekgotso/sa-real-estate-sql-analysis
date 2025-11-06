-- SQL Query: Sales Performance

SELECT 
    city,
    property_type,
    COUNT(*) as properties_sold,
    AVG(listing_price) as avg_asking_price,
    AVG(sale_price) as avg_sale_price,
    AVG((sale_price - listing_price) / listing_price * 100) as avg_price_difference_pct,
    AVG(DATEDIFF(sale_date, listing_date)) as avg_days_on_market
FROM properties
WHERE status = 'Sold' AND sale_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY city, property_type
ORDER BY properties_sold DESC;