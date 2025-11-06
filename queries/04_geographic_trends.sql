-- SQL Query: Geographic Trends

SELECT 
    n.neighborhood_name,
    n.city,
    n.distance_to_cbd_km,
    n.school_rating,
    n.crime_rating,
    COUNT(DISTINCT p.property_id) as properties_sold,
    AVG(p.sale_price / p.size_sqm) as avg_price_per_sqm,
    AVG(p.sale_price) as avg_sale_price
FROM properties p
JOIN neighborhoods n ON p.city = n.city
WHERE p.status = 'Sold'
    AND p.sale_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY n.neighborhood_name, n.city, n.distance_to_cbd_km, 
         n.school_rating, n.crime_rating
HAVING properties_sold >= 5
ORDER BY avg_price_per_sqm DESC
LIMIT 20;