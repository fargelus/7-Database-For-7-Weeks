CREATE OR REPLACE FUNCTION calendar()
RETURNS TABLE (
  _title text,
  _starts timestamp
) AS $$
DECLARE
  target_month_number double precision := -1;
BEGIN
  SELECT extract(month from starts) as month, count(*)
    INTO target_month_number
    FROM events
    GROUP BY month
    ORDER BY count DESC
    LIMIT 1;

  RETURN QUERY
    SELECT title, starts FROM events WHERE extract(month from starts) = target_month_number;
END;
$$  LANGUAGE plpgsql;
