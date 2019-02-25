CREATE RULE delete_venues AS ON DELETE TO venues DO INSTEAD
  UPDATE venues
    SET active = FALSE
    WHERE name = OLD.name;
