

-- TODO: build mart.revenue_by_zone from mart.rides
-- columns: pickup_zone, rides (count), revenue (sum of fare_amount, rounded to 2)
-- biggest revenue first

DROP TABLE IF EXISTS mart.revenue_by_zone;

CREATE TABLE mart.revenue_by_zone AS
SELECT 
    pickup_zone,
    COUNT(ride_id) AS rides,
    ROUND(SUM(fare_amount), 2) AS revenue
FROM mart.rides
GROUP BY pickup_zone
ORDER BY revenue DESC;
