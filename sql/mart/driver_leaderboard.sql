-- TODO: build mart.driver_leaderboard from mart.rides + staging.vehicles
-- columns: driver_name, vehicle_type, rating, rides (count), revenue (sum of fare_amount, rounded to 2)
-- biggest revenue first

DROP TABLE IF EXISTS mart.driver_leaderboard;

CREATE TABLE mart.driver_leaderboard AS
SELECT 
    r.driver_name,
    v.vehicle_type,
    r.rating,
    COUNT(r.ride_id) AS rides,
    ROUND(SUM(r.fare_amount), 2) AS revenue
FROM mart.rides r
LEFT JOIN staging.vehicles v ON r.driver_id = v.driver_id
GROUP BY r.driver_name, v.vehicle_type, r.rating
ORDER BY revenue DESC;
