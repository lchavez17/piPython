#!/usr/bin/python
import MySQLdb
import os
try:
    db = MySQLdb.connect(host="localhost",    # el host
                         user="root",         # tu usuario de base de datos
                         passwd="..",  # tu password de base de datos
                         db="SIMP2")        # nombre de base de datos

    cur2 = db.cursor()
    cur = db.cursor()
    id_arduino=cur2.execute("""SELECT * FROM arduinos""")
    indice=1
    num_lineas=1
    while indice<=id_arduino:
        with open("sensado.txt", "r") as file:
            lines=file.readlines()[-num_lineas].split('/')
        if lines[0] == str(indice):
            print lines
            cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[1],lines[2]))
            cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[3],lines[4]))
            cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[5],lines[6]))
            cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[7],lines[8]))
            db.commit()
            indice +=1
        num_lineas +=1
    db.close()
    # os.system('cp /dev/null /home/lazaax/outpur.txt')
    print "correcto archivo outpur cleaned"
except Exception as e:
    print "error"
