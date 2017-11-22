#!/usr/bin/python
import MySQLdb
import smtplib
import os


try:
    db = MySQLdb.connect(host="localhost",    # el host
                        user="simp",         # tu usuario de base de datos
                        passwd="asdfg123..",  # tu password de base de datos
                        db="SIMP2")        # nombre de base de datos

    cur = db.cursor()
    #cur2 = db.cursor()
    cur.execute("""SELECT correo,valor_min,valor_max FROM alertas WHERE id_arduino=1""")
    # cur.execute("""SELECT valor FROM mediciones WHERE )
    datos= cur.fetchall()
    for value in datos:
        correo =value[0]
        valor_min = value[1]
        valor_max = value[2]
    print correo
    print valor_min
    print valor_max
    cur3 = db.cursor()
    numeroDeSensores = cur3.execute("""SELECT * FROM sensores""")
    datosSensor= cur3.fetchall()
    print datosSensor
    # for value3 in datosSensor:
    #     nombreSensor= value3[1]
    # print numeroDeSensores
    cur2 = db.cursor()
    cadena="SELECT valor FROM mediciones WHERE id_sensor ORDER BY id_mediciones ASC LIMIT "
    cadena+=str(numeroDeSensores)
    #print cadena
    cur2.execute(cadena)
    datos2 = cur2.fetchall()
    for value2 in datos2:
        valorMedicion = value2[0]
        print valorMedicion
        if valorMedicion < valor_min or valorMedicion > valor_max:
            print "mandar alerta"
            username = 'correo@gmail.com'
            password = 'passsw0rd'
            mailsend='simpcolima@gmail.com'
            mailrec= correo
            sensado='4994994'
            server = smtplib.SMTP('smtp.gmail.com:587')
            server.ehlo()
            server.starttls()
            server.login(username,password)
            msg = "\r\n".join([
              "Subject: Mensaje de Alerta!!!!!",
              "",
              "Sensor:"+str(datosSensor)+"valor:" +str(valorMedicion)
              ])
            server.sendmail(mailsend,mailrec,msg)
            server.quit()





except Exception as e:
    raise
