-- SQL Query: Market Overview

SELECT 
    city,
    property_type,
    COUNT(*) as total_listings,
    AVG(listing_price) as avg_price,
    MIN(listing_price) as min_price,
    MAX(listing_price) as max_price,
    STDDEV(listing_price) as price_stddev
FROM properties
WHERE status IN ('Listed', 'Under Offer')
GROUP BY city, property_type
ORDER BY city, avg_price DESC;