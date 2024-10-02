import sqlite3
#1-connect to a database
conn=sqlite3.connect("dat.db")

#2-create a cousor object
cur=conn.cursor()

#3-write an SQL query
cur.execute("CREATE TABLE IF NOT EXISTS store (item TEXT, quant INTEGER , price REAL)")
cur.execute('INSERT INTO store VALUES ("sugar",1,7.5)')#new
#4-commit changes
conn.commit()

#5-close connection
conn.close()
