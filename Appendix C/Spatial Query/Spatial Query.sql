use palliativecare;

SELECT * FROM palliativecare.zip;


-- 1 Frederiksted vs Deerfield
select latitude, longitude from palliativecare.zip;

-- Calc Distance
-- Initialize variables
SET @lat1 =17.71;

SET @long1 =-64.88;

SET @lat2 =43.1413;

SET @long2 =-71.2481;

-- Use Formula
SELECT ( GLength( LineString(( PointFromWKB( POINT( @lat1, @long1 ))), ( PointFromWKB( POINT( @lat2, @long2 ) ))))) * 100 AS distance;

-- 2 Arroyo vs Newbury
select latitude, longitude from palliativecare.zip;

-- Calc Distance
-- Initialize variables
SET @lat1 =18.0002;

SET @long1 =-66.0429;

SET @lat2 =42.7733;

SET @long2 =-70.8502;

-- Use Formula
SELECT ( GLength( LineString(( PointFromWKB( POINT( @lat1, @long1 ))), ( PointFromWKB( POINT( @lat2, @long2 ) ))))) * 100 AS distance;

-- 3 San Juan vs Kingston
select latitude, longitude from palliativecare.zip;

-- Calc Distance
-- Initialize variables
SET @lat1 =18.4527;

SET @long1 =-66.0781;

SET @lat2 =41.9872;

SET @long2 =-70.7419;

-- Use Formula
SELECT ( GLength( LineString(( PointFromWKB( POINT( @lat1, @long1 ))), ( PointFromWKB( POINT( @lat2, @long2 ) ))))) * 100 AS distance;

-- 4 Holtsville vs Block Island
select latitude, longitude from palliativecare.zip;

-- Calc Distance
-- Initialize variables
SET @lat1 =40.81;

SET @long1 =-73.04;

SET @lat2 =41.1768;

SET @long2 =-71.577;

-- Use Formula
SELECT ( GLength( LineString(( PointFromWKB( POINT( @lat1, @long1 ))), ( PointFromWKB( POINT( @lat2, @long2 ) ))))) * 100 AS distance;

-- 5 Ensenada vs Aguirre
select latitude, longitude from palliativecare.zip;

-- Calc Distance
-- Initialize variables
SET @lat1 =17.9636;

SET @long1 =-66.9471;

SET @lat2 =17.9658;

SET @long2 =-66.2195;

-- Use Formula
SELECT ( GLength( LineString(( PointFromWKB( POINT( @lat1, @long1 ))), ( PointFromWKB( POINT( @lat2, @long2 ) ))))) * 100 AS distance;
