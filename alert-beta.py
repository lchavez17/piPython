#!/usr/bin/python
#Script para el proyecto integrador
#de la facultad de telematica
#Edson Jimenez
#Leon Chavez
#
import MySQLdb
import smtplib
import os
import datetime

hora_de_log=datetime.datetime.now()

try:
    db = MySQLdb.connect(host="localhost",    # el host
                        user="simp",         # tu usuario de base de datos
                        passwd="simpcolima",  # tu password de base de datos
                        db="SIMP2")        # nombre de base de datos

    cur_sensores = db.cursor()
    numero_de_sensores = cur_sensores.execute("SELECT * FROM sensores")
    cur_arduinos= db.cursor()
    numero_de_arduninos = cur_arduinos.execute("SELECT * FROM arduinos")
    # print "total de arduinos: "+ str(numero_de_arduninos)
    arduinos_actuales=cur_arduinos.fetchall()
    for id_arduino in arduinos_actuales:
        arduino_actual=id_arduino[0]
        arduino_nombre=id_arduino[1]
        arduino_ubicacion=id_arduino[2]
        # print "Arduinos por id: "+ str(arduino_actual)
        cur_mediciones = db.cursor()
        sentencia_sql_mediciones="SELECT id_sensor,id_arduino,valor FROM mediciones WHERE id_sensor AND id_arduino="+str(arduino_actual)+" ORDER BY id_mediciones DESC LIMIT "+str(numero_de_sensores)
        # sentencia_sql_mediciones+=str(numero_de_sensores)
        cur_mediciones.execute(sentencia_sql_mediciones)
        valores_sensores = cur_mediciones.fetchall()
        for valor_mediciones in valores_sensores:
            sensor=valor_mediciones[0]
            arduino=valor_mediciones[1]
            valorMedicion = valor_mediciones[2]
            # print "sensor:"+str(sensor)
            # print "arduino: "+str(arduino)
            # print "valor medicion: " + str(valorMedicion)
            cur_alarma = db.cursor()
            sentencia_valores_alarmas="SELECT correo,valor_minimo,valor_maximo,descripcion,alarma_enviada FROM alarmas_configuracion WHERE id_arduino="+str(arduino)+" AND id_sensor="+str(sensor)
            cur_alarma.execute(sentencia_valores_alarmas)
            datos_alarmas_conf= cur_alarma.fetchall()
            for alarmas_configuracion in datos_alarmas_conf:
                correo = alarmas_configuracion[0]
                valor_min = alarmas_configuracion[1]
                valor_max = alarmas_configuracion[2]
                descripcion = alarmas_configuracion[3]
                alarma_enviada=alarmas_configuracion[4]
                # print "correo de responsable: "+ str(correo)
                # print "valor minimo: "+ str(valor_min)
                # print "valor maximo: "+ str(valor_max)
                if (valorMedicion < valor_min or valorMedicion > valor_max) and alarma_enviada==0:
                    cur_sensores.execute("SELECT * FROM sensores WHERE id_sensores="+str(sensor))
                    sensor_actual = cur_sensores.fetchall()
                    for sensor_capturado in sensor_actual:
                        sensor_nombre = sensor_capturado[1]

                    print "Enviando alarma a "+ str(correo)
                    print "Arduino: "+ str(arduino)
                    print "sensor: "+str(sensor_nombre)
                    print "valor medicion: " + str(valorMedicion)
                    print "Ubicacion: " + str(arduino_ubicacion)
                    print "Descripcion: " + str(descripcion)
                    print "_____________________________"
                    cur_insertar_alarma=db.cursor()
                    cur_insertar_alarma.execute("""INSERT INTO alarmas (id_arduino,nombre_sensor,valor) VALUES(%s,%s,%s)""",(arduino,sensor_nombre,valorMedicion))
                    cur_actualiza_alarma_enviada=db.cursor()
                    sentencia_alarma_enviada="UPDATE alarmas_configuracion SET alarma_enviada=1 where id_arduino="+str(arduino)+" and id_sensor="+str(sensor)
                    cur_actualiza_alarma_enviada.execute(sentencia_alarma_enviada)
                    db.commit()
                    username = 'sssa@gmail.com'
                    password = 'asd..'
                    correo_envia='simpcolima@gmail.com'
                    correo_recive = correo
                    server = smtplib.SMTP('smtp.gmail.com:587')
                    server.ehlo()
                    server.starttls()
                    server.login(username,password)
                    msg = "\r\n".join([
                      "Subject: Mensaje de Alerta!!!!!",
                      ""+str(descripcion),
                      "Alerta!!!! Sensor: "+str(sensor_nombre), "Arduino: "+str(arduino),"Valor: " +str(valorMedicion),"Ubicado: "+ str(arduino_ubicacion),
                      str(hora_de_log)
                      ])
                    server.sendmail(correo_envia,correo_recive,msg)
                    server.quit()
    db.close()
    print hora_de_log
except Exception as e:
    raise
    print e
