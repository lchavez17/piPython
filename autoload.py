#!/usr/bin/python
import MySQLdb
import os
import datetime

hora_de_log=datetime.datetime.now()
output="/home/lazaax/sensado.txt"
try:
    try:
        db = MySQLdb.connect(host="localhost",    # el host
                            user="root",         # tu usuario de base de datos
                            passwd="asdfg123..",  # tu password de base de datos
                            db="SIMP2")        # nombre de base de datos
        cur2 = db.cursor()
        cur = db.cursor()
    except Exception as a:
        print "error de conexion"
        print a

    id_arduino=cur2.execute("""SELECT * FROM arduinos""")
    indice=1
    num_lineas=1
    sensor=1
    valor=2

    while indice<=id_arduino:
        try:
            with open("/home/lazaax/sensado.txt", "r") as file:
                  lines=file.readlines()[-num_lineas].split('/')

        except Exception as e:
            num_lineas=1

        if lines[0] == str(indice):
            print lines
            for value in range(1,(len(lines))/2): #for para agregar los sensores y valores..
                cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[sensor],lines[valor]))
                db.commit()
                sensor+=2 #valores impares
                valor+=2 #valores pares
            indice +=1
            sensor=1
            valor=2
        else:
            num_lineas +=1

    db.close()
    # os.system('cp /dev/null '+output)

    print "correcto archivo output limpio"
except Exception as e:
    print "error general"
    print e

print hora_de_log
