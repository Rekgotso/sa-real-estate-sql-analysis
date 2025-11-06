-- SQL Query: Comprehensive Report

SELECT 
    p.property_id,
    p.address,
    p.city,
    p.property_type,
    p.bedrooms,
    p.bathrooms,
    p.size_sqm,
    p.listing_price,
    p.sale_price,
    a.agent_name,
    a.agency_name,
    n.neighborhood_name,
    n.school_rating,
    n.crime_rating,
    pf.has_pool,
    pf.has_solar_panels,
    pf.has_security,
    CASE 
        WHEN pf.has_pool THEN 1 ELSE 0 
    END +
    CASE 
        WHEN pf.has_solar_panels THEN 1 ELSE 0 
    END +
    CASE 
        WHEN pf.has_security THEN 1 ELSE 0 
    END +
    CASE 
        WHEN pf.has_garden THEN 1 ELSE 0 
    END as premium_feature_count,
    DATEDIFF(COALESCE(p.sale_date, CURDATE()), p.listing_date) as days_listed
FROM properties p
LEFT JOIN agents a ON p.agent_id = a.agent_id
LEFT JOIN neighborhoods n ON p.city = n.city
LEFT JOIN property_features pf ON p.property_id = pf.property_id
WHERE p.listing_date >= DATE_SUB(CURDATE(), INTERVAL 12 MONTH)
ORDER BY p.listing_date DESC;