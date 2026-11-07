-- NYC Yellow Taxi Analytics
-- DuckDB SQL Analysis

-- 1. Daily trip demand
SELECT
    CAST(tpep_pickup_datetime AS DATE) AS trip_date,
    COUNT(*) AS total_trips,
    ROUND(SUM(total_amount), 2) AS total_passenger_charges,
    ROUND(AVG(fare_amount), 2) AS avg_fare
FROM clean_taxi
GROUP BY trip_date
ORDER BY trip_date;


-- 2. Top 10 pickup zones
SELECT
    PULocationID AS pickup_zone_id,
    COUNT(*) AS total_trips
FROM clean_taxi
GROUP BY PULocationID
ORDER BY total_trips DESC
LIMIT 10;


-- 3. Top 10 pickup-dropoff routes
SELECT
    PULocationID AS pickup_zone_id,
    DOLocationID AS dropoff_zone_id,
    COUNT(*) AS total_trips
FROM clean_taxi
GROUP BY PULocationID, DOLocationID
ORDER BY total_trips DESC
LIMIT 10;


-- 4. Hourly demand
SELECT
    EXTRACT(HOUR FROM tpep_pickup_datetime) AS pickup_hour,
    COUNT(*) AS total_trips
FROM clean_taxi
GROUP BY pickup_hour
ORDER BY pickup_hour;
