-- TODO: rebuild staging.rides from raw.rides
-- keep all 7 columns, but only the GOOD rides:
--   - no duplicates
--   - fare_amount > 0
--   - driver_id exists in raw.drivers

DROP TABLE IF EXISTS staging.rides;

CREATE TABLE staging.rides AS
SELECT DISTINCT 
    ride_id, requested_at, driver_id, pickup_zone_id, dropoff_zone_id, distance_km, fare_amount
FROM raw.rides
WHERE fare_amount > 0 
  AND driver_id IN (SELECT driver_id FROM raw.drivers);