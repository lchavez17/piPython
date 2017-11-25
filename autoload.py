#!/usr/bin/python
#Script para el proyecto integrador
#de la facultad de telematica
#Edson Jimenez
#Leon Chavez
#
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
            indice+=1

        if lines[0] == str(indice):
            print lines
            for value in range(1,(len(lines))/2): #for para agregar los sensores y valores.. arreglar esta linea si un trama es mas chica que la otra truna
                cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[sensor],lines[valor]))
                # print value
                db.commit()
                sensor+=2 #valores impares
                valor+=2 #valores pares
            indice +=1
            sensor=1
            valor=2
        else:
            num_lineas +=1

    cur_reiniciar_alarma=db.cursor()
    cur_reiniciar_alarma.execute("UPDATE alarmas_configuracion SET alarma_enviada=0 where id")
    print "Resetiando Valores de alarmas enviadas"
    db.commit()
    db.close()
    # os.system('cp /dev/null '+output)

    print "correcto archivo output limpio"
except Exception as e:
    print "error general"
    print e

print hora_de_log
