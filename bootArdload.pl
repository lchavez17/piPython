#!/usr/bin/perl
##Script para el proyecto integrador
#de la facultad de telematica
#Edson Jimenez
#Leon Chavez
# Auto cargando arduino
#

$devName = `lsusb | grep QinHeng | head -1 | awk '{print \$7}'` || die "No hay arduino reconocida\n";
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
