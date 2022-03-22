import psycopg2


conn = psycopg2.connect(host="localhost", port = 5432, database="equipment", user="equipment", password="testing")
cur = conn.cursor()

cur.execute("SELECT material_id, name, description, tensile_strength FROM material")
rows = cur.fetchall()

# Will print out the material table outlining useful information for a gym equipment purchaser
for row in rows:
        print("Material ID = ", row[0])
        print("Name = ", row[1])
        print("Description = ", row[2])
        print("Tensile Strength = ", row[3], "\n")

cur.close()
conn.close()
