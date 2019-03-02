CREATE OR REPLACE FUNCTION calendar()
  RETURNS TABLE (
    month double precision,
    day double precision,
    count bigint
  ) AS $$
BEGIN
  RETURN QUERY
  SELECT extract(month from starts) as month,
    extract(day from starts) as day, count(*)
    FROM events
    GROUP BY month, day
    ORDER BY count DESC
    LIMIT 1;
END;
$$  LANGUAGE plpgsql;
