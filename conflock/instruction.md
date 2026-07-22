# Hyprlock Theme Specification
## Proyecto: Batman Modern LockScreen
### Versión 1.0

---

# Objetivo

Crear un tema para Hyprlock inspirado en el lockscreen mostrado en la referencia (QML), manteniendo la misma filosofía visual pero adaptándolo completamente a Hyprlock.

No se pretende una copia pixel-perfect del código QML, sino una recreación visual extremadamente cercana utilizando únicamente las capacidades nativas de Hyprlock.

---

# Resolución objetivo

1920x1200

Todo el posicionamiento deberá estar optimizado para esta resolución.

El tema deberá seguir viéndose correctamente en 1920x1080 realizando únicamente pequeños ajustes de posición.

---

# Filosofía del diseño

Minimalista

Elegante

Oscuro

Mucho espacio negativo

Sin elementos innecesarios

Bordes suaves

Transparencias

Inspiración:

- Modern KDE
- GNOME Login
- Nord
- Material You
- QML

---

# Paleta

Fondo:

casi negro

#0F1115

Tarjetas:

rgba(25,25,30,0.72)

Bordes:

rgba(255,255,255,0.10)

Texto principal:

#ECECEC

Texto secundario:

#B8BEC8

Color de acento:

#8DA6B5

Color de éxito:

#B9D6B3

Color de error:

#D88A8A

---

# Fondo

El lockscreen debe utilizar screenshot + blur.

No utilizar una imagen fija.

El blur debe ser suave.

El fondo debe oscurecerse ligeramente para favorecer el contraste.

---

# Distribución

El diseño se divide en tres bloques.

###############

Bloque superior

###############

Tarjeta flotante.

Ancho aproximado:

540 px

Altura:

110 px

Esquinas:

22 px

Dentro contiene:

Avatar circular

Texto de bienvenida

Fecha

Hora

---

Avatar

Situado a la izquierda.

Círculo con borde fino.

Diámetro:

56 px

Dentro un icono simple de usuario.

---

Texto bienvenida

"Welcome back, ae!"

Fuente:

Semibold

Color blanco.

---

Fecha

Formato:

Sunday, July 12

Color gris claro.

Tamaño inferior al saludo.

---

Hora

A la derecha.

Debe mantenerse exactamente como la referencia.

NO usar

23:02

SÍ usar

23
02

Dos líneas.

Fuente:

Bold

Alineación derecha.

---

###############

Bloque central

###############

Logo Batman

Imagen PNG

Color blanco

Sin sombra

Centrado

Anchura aproximada:

360 px

Separación amplia respecto a las tarjetas.

---

###############

Bloque inferior

###############

Tarjeta principal

Ancho:

aprox 1050 px

Altura:

220 px

Esquinas:

24 px

Mismo color que la tarjeta superior.

---

Fila superior

Contiene:

Icono luna

Batería

Distribución teclado

Estado Caps Lock

Distribución horizontal.

No utilizar clima.

---

Indicador batería

Mostrar:

Icono

Porcentaje

Ejemplo

69%

Actualizar automáticamente.

---

Distribución teclado

Mostrar

US

ES

LATAM

etc.

Obtener desde Hyprland.

Actualizar automáticamente.

---

Caps Lock

Mostrar únicamente cuando esté activado.

Si está desactivado:

ocultar completamente.

No mostrar texto "Caps Lock Off".

---

###############

Password Field

###############

Elemento principal.

Debe ocupar aproximadamente el 85% del ancho de la tarjeta.

NO utilizar el tamaño por defecto de Hyprlock.

Altura:

52 px

Bordes:

18 px

Color interior:

gris oscuro

Borde:

azul grisáceo (#8DA6B5)

Placeholder invisible.

El cursor debe permanecer centrado verticalmente.

Los puntos de contraseña deben quedar alineados como en la referencia.

---

Estados

Sin escribir

borde azul tenue

Escribiendo

ligero aumento del brillo

Error

borde rojo

mensaje inferior

Unlocked

animación de desaparición

---

Iconos

Todos los iconos deben provenir de Nerd Fonts.

No utilizar emojis.

---

Fuentes

Principal:

Inter

Alternativas:

SF Pro Display

Noto Sans

Roboto

Nunca usar una fuente monoespaciada para el texto.

---

Espaciados

Mucho aire entre elementos.

No saturar.

El diseño debe sentirse premium.

---

Scripts necesarios

battery.sh

Obtiene:

/sys/class/power_supply/BAT*/capacity

Devuelve:

69%

---

keyboard.sh

Obtiene layout actual desde:

hyprctl devices

Devuelve:

US

LATAM

ES

etc.

---

capslock.sh

Detecta estado de Caps Lock.

Si está apagado:

cadena vacía.

Si está encendido:

Caps Lock

---

Archivos

~/.config/hypr/

hyprlock.conf

scripts/

battery.sh

keyboard.sh

capslock.sh

assets/

batman.png

avatar.png

---

Organización del código

Separar por bloques.

####################################

BACKGROUND

####################################

####################################

TOP CARD

####################################

####################################

BATMAN LOGO

####################################

####################################

BOTTOM CARD

####################################

####################################

PASSWORD FIELD

####################################

####################################

BATTERY

####################################

####################################

KEYBOARD

####################################

####################################

CAPS LOCK

####################################

Todo comentado.

---

No incluir

No incluir clima.

No incluir botones Logout.

No incluir Suspend.

No incluir Shutdown.

No incluir Reboot.

---

Resultado esperado

Al observar el lockscreen terminado debe transmitir inmediatamente la sensación de un tema profesional de Hyprland inspirado en la referencia QML.

La diferencia visual respecto a la imagen original debe ser inferior al 5%.

El usuario debe reconocer instantáneamente la inspiración sin que parezca una copia exacta.

Debe sentirse limpio, moderno y coherente con un escritorio Hyprland minimalista.
