-- Тригер, який при додаванні нового рядка в таблицю locations записує
-- значення поля city у верхньому регістрі.


-- Перший етап: створення тригерної функції
CREATE OR REPLACE FUNCTION upper_city() RETURNS trigger 
LANGUAGE 'plpgsql'
AS
$$
     BEGIN
          UPDATE locations
          SET city = upper(city) WHERE locations.name_of_wonder = NEW.name_of_wonder; 
		  RETURN NULL; -- result is ignored since this is an AFTER trigger
     END;
$$;

-- Другий етап: створення тригеру
CREATE TRIGGER locations_insert 
AFTER INSERT ON locations
FOR EACH ROW EXECUTE FUNCTION upper_city()

-- Перевірка роботи.
INSERT INTO locations(name_of_wonder,city, country,latitude,longtitude) VALUES ('Catocombs of Kom el Shoqafa', 'Alexandria','Egypt', '31.178558','29.892954');