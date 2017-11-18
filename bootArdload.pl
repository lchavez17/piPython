#!/usr/bin/perl
##Script para el proyecto integrador
#de la facultad de telematica
#Edson Jimenez
#Leon Chavez
# Auto cargando arduino
#

$time = localtime();
$devUsb = `ls /dev/ | grep ttyUSB` || die "Arduino no conectada";
$devPs = `pgrep -f ttyUSB`;

if ($devPs) {
        print "procesos de consola $devPs";
} else {
        print "el device del arduino es: $devUsb";
        print "ejecutando consola en $devUsb";
        system("/home/lazaax/piPython/init.sh");
}

#lzx
