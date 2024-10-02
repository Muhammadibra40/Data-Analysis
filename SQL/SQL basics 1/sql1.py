import sqlite3
#1-connect to a database
conn=sqlite3.connect("dat.db")

#2-create a cousor object
cur=conn.cursor()#tool to write sql instuction through python code

#3-write an SQL query
cur.execute("CREATE TABLE store (item TEXT, quant INTEGER , price REAL)")

#4-commit changes
conn.commit()#RUN the code

#5-close connection
conn.close()

