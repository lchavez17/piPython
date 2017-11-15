#!/usr/bin/python
import MySQLdb
import os
import datetime

hora_de_log=datetime.datetime.now()
output="/home/lazaax/sensado.txt"
try:
    try:
        db = MySQLdb.connect(host="localhost",    # el host
                            user="simp",         # tu usuario de base de datos
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
    nada=393939

    while indice<=id_arduino:
        try:
            with open("/home/lazaax/sensado.txt", "r") as file:
                  lines=file.readlines()[-num_lineas].split('/')

        except Exception as e:
            num_lineas=1


        if lines[0] == str(indice):
            for value in range(1,(len(lines))/2): #for para agregar los
                # print value
                print lines
                cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[sensor],lines[valor]))
                # cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[3],lines[4]))
                # cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[5],lines[6]))
                # cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[7],lines[8]))
                db.commit()
                sensor+=2
                valor+=2
                #valor=sensor+1
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
