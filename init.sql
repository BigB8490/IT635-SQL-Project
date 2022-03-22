CREATE DATABASE equipment;
CREATE USER equipment WITH ENCRYPTED PASSWORD 'testing';
GRANT ALL PRIVILEGES ON DATABASE "equipment" to equipment;
GRANT USAGE ON SCHEMA public TO equipment;
GRANT CONNECT ON DATABASE equipment TO equipment;
ALTER USER equipment WITH SUPERUSER;
\c equipment equipment;

CREATE TABLE material (
	  material_id 	  INTEGER NOT NULL,
	  name            VARCHAR(128) NOT NULL,
	  description 	  VARCHAR(256) NOT NULL,
	  tensile_strength INTEGER NOT NULL,
	  PRIMARY KEY     ( material_id )
);

CREATE TABLE costs (
	  cost_id     	 INTEGER NOT NULL,
	  material_id    INTEGER NOT NULL,
	  price 	 DECIMAL(10,2) NOT NULL,
	  CONSTRAINT fk_material_id FOREIGN KEY (material_id) REFERENCES material(material_id)
	  PRIMARY KEY     ( cost_id )
);

CREATE TABLE usages (
	  usage_id         INTEGER NOT NULL,
	  cost_id	   INTEGER NOT NULL,
	  purpose          VARCHAR(256) NOT NULL,
	  location_to_purchase  VARCHAR(256) NOT NULL,
	  CONSTRAINT fk_cost_id FOREIGN KEY (cost_id) REFERENCES costs(cost_id)
	  PRIMARY KEY ( usage_id )
	  
);

GRANT ALL PRIVILEGES ON material, costs, usages TO equipment;

INSERT INTO material VALUES (0, 'Steel', 'Steel is the highest quality material used on barbells and weight plates in the gym. It has the highest durability, and as such, is typically the most expensive', '205000');
INSERT INTO material VALUES (1, 'Cast Iron', 'Cast Iron is of a notably lesser quality, but is significantly more affordable for gym equipment owners. It is frequently found in all-in-one training equipment sets for young adults', '120000');
INSERT INTO material VALUES (2, 'Bronze', 'Bronze is a material used much less frequently than steel or cast iron, but it is much more attainable and can be used in making custom gym equipment, due to its high affordability', '85000');
INSERT INTO costs VALUES (0, 0, '449.52');
INSERT INTO costs VALUES (1, 1, '262.73');
INSERT INTO costs VALUES (2, 2, '160.41');
INSERT INTO usages VALUES (0, 0, 'Used for extremely heavy loads on the barbell with minimal stress exerted on the bar shaft', 'Can be purchased at Rogue Fitness, EliteFTS, Titan Fitness, and small competitors as well');
INSERT INTO usages VALUES (1, 1, 'Used for light to moderate loads. Frequently found in beginner training where technique training is the priority. It is also easily replaceable', 'Can be found on Rogue Fitness, Amazon, and re-sell marketplaces such as Craigslist');
INSERT INTO usages VALUES (2, 2, 'Used in adolescent training. Bars can be cut to size to be a best fit for the user, and it is even more obtainable than steel or iron since you can buy bronze in bulk', 'Not found on many fitness marketplaces, but can be acquired on material wholesale locations such as the Online Metals website');


