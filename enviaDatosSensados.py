#!/usr/bin/python
import MySQLdb
import os
# import datetime
# date=datetime.datetime.now()
# text_file = open("sensado.txt", "r")
# lines = text_file.read().split('/')
with open("sensado.txt", "r") as file:
    lines=file.readlines()[-1].split('/')
try:
    db = MySQLdb.connect(host="localhost",    # your host, usually localhost
                         user="root",         # your username
                         passwd="asdfg123..",  # your password
                         db="SIMP2")        # name of the data base
    cur = db.cursor()
    cur2=db.cursor()
    cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[1],lines[2]))
    cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[3],lines[4]))
    cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[5],lines[6]))
    cur.execute("""INSERT INTO mediciones (id_arduino,id_sensor,valor) VALUES(%s,%s,%s)""",(lines[0],lines[7],lines[8]))
    db.commit()
    db.close()
    print lines
    # os.system('cp /dev/null /home/lazaax/outpur.txt')
    print "correcto archivo outpur cleaned"
except Exception as e:
    print "error"
