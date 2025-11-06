-- SQL Query: Feature Impact

SELECT 
    CASE WHEN pf.has_pool THEN 'Yes' ELSE 'No' END as has_pool,
    CASE WHEN pf.has_solar_panels THEN 'Yes' ELSE 'No' END as has_solar,
    CASE WHEN pf.has_borehole THEN 'Yes' ELSE 'No' END as has_borehole,
    COUNT(*) as property_count,
    AVG(p.sale_price) as avg_sale_price,
    AVG(p.sale_price / p.size_sqm) as avg_price_per_sqm
FROM properties p
JOIN property_features pf ON p.property_id = pf.property_id
WHERE p.status = 'Sold' AND p.sale_date >= DATE_SUB(CURDATE(), INTERVAL 24 MONTH)
GROUP BY has_pool, has_solar, has_borehole
HAVING property_count >= 10
ORDER BY avg_sale_price DESC;