import sqlite3
def create_table(table_name="store"):
    #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query
    cur.execute("CREATE TABLE IF NOT EXISTS " +table_name+" (item TEXT, quant INTEGER , price REAL)")
    #4-commit changes
    conn.commit()

    #5-close connection
    conn.close()

def insert(item,quant,price):

     #1-connect to a database
    conn=sqlite3.connect("dat.db")

    #2-create a cousor object
    cur=conn.cursor()

    #3-write an SQL query                         cofee   10     2.5
    cur.execute("INSERT INTO store VALUES (?,?,?)",(item,quant,price))#INSERT INTO store VALUES ("cofee",10,2.5)
    #4-commit changes
    conn.commit()

    #5-close connection
    conn.close()
    
create_table()
insert("cofee",10,2.5)



