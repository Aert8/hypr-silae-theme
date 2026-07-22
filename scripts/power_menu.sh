#!/bin/bash

# 1. Definir las opciones con iconos
shutdown="⏻  Apagar"
reboot="  Reiniciar"
logout="  Cerrar Sesión"
hibernate="󰒲  Hibernar"
cancel="  Cancelar"

# 2. Mostrar el menú con Wofi
# Le pasamos las opciones con 'echo' y usamos el modo '--dmenu'
# Ajustamos el tamaño para que sea una ventanita pequeña
selected_option=$(echo -e "$shutdown\n$reboot\n$logout\n$hibernate\n$cancel" | wofi --dmenu --style ~/.config/wofi/style_power.css --prompt "Bye!" --width 200 --height 210 --cache-file /dev/null)

# 3. Ejecutar el comando según lo que eligió el usuario
if [ "$selected_option" == "$shutdown" ]; then
    systemctl poweroff
elif [ "$selected_option" == "$reboot" ]; then
    systemctl reboot
elif [ "$selected_option" == "$hibernate" ]; then
    systemctl hibernate
elif [ "$selected_option" == "$logout" ]; then
    # PRIMERO: Matamos los procesos explícitamente
    killall -q waybar dunst swaybg wpaperd
    
    # SEGUNDO: Esperamos un instante
    sleep 0.5
    
    # TERCERO: Salimos de Hyprland
    hyprctl dispatch exit
else
    echo "Cancelado"
fi
