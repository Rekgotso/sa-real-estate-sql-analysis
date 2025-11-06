-- SQL Query: Price Volatility

WITH price_changes AS (
    SELECT 
        p.property_id,
        p.address,
        p.city,
        p.listing_price,
        COUNT(ph.history_id) as number_of_changes,
        MIN(ph.new_price) as lowest_price,
        MAX(ph.new_price) as highest_price,
        (MAX(ph.new_price) - MIN(ph.new_price)) / MIN(ph.new_price) * 100 as price_volatility_pct
    FROM properties p
    JOIN price_history ph ON p.property_id = ph.property_id
    GROUP BY p.property_id, p.address, p.city, p.listing_price
    HAVING number_of_changes >= 2
)
SELECT *
FROM price_changes
ORDER BY price_volatility_pct DESC;