#search
import sqlite3
def create_table():
    #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query
    cur.execute("CREATE TABLE IF NOT EXISTS store (item TEXT, quant INTEGER , price REAL)")
    #4-commit changes
    conn.commit()

    #5-close connection
    conn.close()


def insert(item,quant,price):

     #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query
    cur.execute("INSERT INTO store VALUES (?,?,?)",(item,quant,price))
    #4-commit changes
    conn.commit()

    #5-close connection
    conn.close()


def view():
     #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query
    cur.execute("SELECT * FROM store")
    #4-fetch data
    rows=cur.fetchall()

    #5-close connection
    conn.close()
    return rows

def delete(item):

     #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query
    cur.execute("DELETE FROM store WHERE item=?",(item,))
    #4-commit changes
    conn.commit()

    #5-close connection
    conn.close()


def update(item,quant,price):

     #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query
    cur.execute("UPDATE store SET quant=?, price=? WHERE item=?",(quant,price,item))
    #4-commit changes
    conn.commit()

    #5-close connection
    conn.close()
    
def search(item="",quant="",price=""):
     #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query
    cur.execute("SELECT * FROM store where item=? OR quant=? OR price=?",(item,quant,price))
    #cur.execute("SELECT * FROM store where item=? AND quant=?",(item,quant))
    #4-fetch data
    rows=cur.fetchall()

    #5-close connection
    conn.close()
    return rows
#insert("milk",10,40)
output=search(item="milk",quant=10)
print(output)
