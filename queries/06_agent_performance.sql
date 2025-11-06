-- SQL Query: Agent Performance

SELECT 
    a.agent_name,
    a.agency_name,
    a.city,
    COUNT(p.property_id) as properties_sold,
    SUM(p.sale_price) as total_sales_value,
    AVG(p.sale_price) as avg_sale_price,
    AVG(DATEDIFF(p.sale_date, p.listing_date)) as avg_days_to_sell,
    RANK() OVER (PARTITION BY a.city ORDER BY SUM(p.sale_price) DESC) as city_rank
FROM agents a
JOIN properties p ON a.agent_id = p.agent_id
WHERE p.status = 'Sold' 
    AND p.sale_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
GROUP BY a.agent_id, a.agent_name, a.agency_name, a.city
HAVING properties_sold >= 5
ORDER BY total_sales_value DESC;