# Batman Modern LockScreen

Tema de Hyprlock inspirado en la referencia y ajustado para `1920x1200`.

El archivo activo es `~/.config/hypr/hyprlock.conf`; las rutas de recursos
apuntan a este directorio (`~/.config/hypr/conflock`). Para usarlo desde
Hyprland:

```sh
hyprlock
```

Requisitos: Hyprlock, `hyprctl`, una Nerd Font (para los iconos) e Inter.
Los scripts se actualizan únicamente con algún monitor activo por DPMS. Si
Hyprland no puede informar ese estado, usan la tapa abierta como respaldo.
Durante el bloqueo, batería se consulta cada 60 segundos, distribución de
teclado cada 500 ms y Caps Lock cada 250 ms.
