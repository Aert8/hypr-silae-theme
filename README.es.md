<div align="center">

<br/>

```
 ██████╗ ██╗██╗      █████╗ ███████╗
██╔════╝ ██║██║     ██╔══██╗██╔════╝
███████╗ ██║██║     ███████║█████╗  
╚════██║ ██║██║     ██╔══██║██╔══╝  
███████║ ██║███████╗██║  ██║███████╗
╚══════╝ ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝
```

# hypr-silae-theme

**Una configuración modular y oscura para Hyprland en Debian — inspirada en Silksong.**

[![Hyprland](https://img.shields.io/badge/Hyprland-compositor-8b0000?style=for-the-badge&logo=linux&logoColor=white&color=1a0a0a&labelColor=8b0000)](https://hyprland.org/)
[![Hyprlock](https://img.shields.io/badge/Hyprlock-incluido-8b0000?style=for-the-badge&color=1a0a0a&labelColor=8b0000)](https://github.com/hyprwm/hyprlock)
[![Hypridle](https://img.shields.io/badge/Hypridle-incluido-8b0000?style=for-the-badge&color=1a0a0a&labelColor=8b0000)](https://github.com/hyprwm/hypridle)
[![License](https://img.shields.io/badge/Licencia-MIT-8b0000?style=for-the-badge&color=1a0a0a&labelColor=8b0000)](./LICENSE)
[![Debian](https://img.shields.io/badge/Debian-Linux-8b0000?style=for-the-badge&logo=debian&logoColor=white&color=1a0a0a&labelColor=8b0000)](https://www.debian.org/)

🌐 **Idioma:** [English](./README.md) | Español

</div>

---

## Vista previa

<div align="center">

### Escritorio

![Escritorio Hyprland](assets/hyprland.png)

### Pantalla de bloqueo

![Pantalla de bloqueo](assets/lockscreen-empty-workspace.png)

<details>
<summary><b>Más capturas →</b></summary>
<br/>

![Lockscreen — fondo negro](assets/lockscreen.png)

*Pantalla de bloqueo con fondo negro*

![Lockscreen — Caps Lock activo](assets/lockscreen-caps-active.png)

*Aviso de Caps Lock activo en la pantalla de bloqueo*

</details>

</div>

---

## ✦ ¿Qué es esto?

**hypr-silae-theme** es una configuración modular para el ecosistema Hypr disponible en los repositorios de Debian. Por eso, ten en cuenta que la versión de la sintaxis **(y en general la versión de Hyprland)** puede ser más antigua que en distros rolling-release como Arch Linux. Si encuentras algún problema, intenta actualizar los paquetes manualmente.

> **⚠ Alcance del repositorio**
>
> Esta configuración cubre **únicamente** las herramientas del ecosistema `hypr*`.
> No incluye configuración de otras herramientas del entorno de escritorio.
>
> | ✅ Incluido | ❌ No incluido |
> |------------|--------------|
> | `hyprland.conf` — configuración principal del compositor | Cualquier barra de estado |
> | `hyprlock.conf` — pantalla de bloqueo | Cualquier lanzador de apps |
> | `hypridle.conf` — gestión de inactividad | Cualquier daemon de notificaciones |
> | Sistema de temas modular (`themes/silae/`) | Scripts externos |
>
> Si buscas un entorno completo tipo *rice*, este repositorio es solo una pieza del puzzle. Puede que cuando leas esto ya haya añadido una configuración de waybar u otras herramientas en repositorios separados — revisa mi perfil de GitHub.

---

## ✦ Instalación

> Ten en cuenta que esta configuración fue hecha para funcionar con las siguientes versiones:
> - Hyprland : `0.54.3 built from branch v0.54.3`
> - Hyprlock : `v0.9.5`
> - Hypridle : `v0.1.7`

### Prerrequisitos

Si quieres que todos los atajos de teclado funcionen correctamente, necesitas instalar algunos paquetes. El nombre puede variar según tu distribución. La siguiente lista es para Debian:

- [`Hyprland`](https://hyprland.org/) — compositor Wayland (gestor de ventanas)
- [`hyprlock`](https://github.com/hyprwm/hyprlock) — pantalla de bloqueo
- [`hypridle`](https://github.com/hyprwm/hypridle) — daemon de inactividad
- [`swaybg`](https://github.com/swaywm/swaybg) — para gestionar el fondo de pantalla
- [`wl-clipboard`](https://github.com/wl-clipboard/wl-clipboard) — utilidad de portapapeles para wayland
- [`dunst`](https://github.com/dunst-project/dunst) — daemon de notificaciones
- [`grim`](https://github.com/emilk/grim) — utilidad de capturas de pantalla
- [`slurp`](https://github.com/emilk/slurp) — utilidad de selección de área
- [`cliphist`](https://github.com/sentriz/cliphist) — historial del portapapeles
- [`wofi`](https://hg.sr.ht/~scoopta/wofi) — lanzador de aplicaciones

### Pasos

**1. Clona el repositorio en tu directorio de configuración de Hypr:**

```bash
# Haz una copia de seguridad si ya tienes configuración existente
cp -r ~/.config/hypr ~/.config/hypr.bak

# Clona el repositorio
git clone https://github.com/Aert8/hypr-silae-theme ~/.config/hypr
```

**2. Lanza Hyprland.**

El archivo `hyprland.conf` actúa como punto de entrada y carga automáticamente todos los módulos del tema `silae`. No se requieren pasos adicionales.

**3. (Opcional) Personaliza los módulos:**

```bash
# Ruta para editar los programas por defecto (si no quieres instalar apps extra)
~/.config/hypr/themes/silae/hyprland/config/programs.conf

# Ruta para editar la paleta de colores
~/.config/hypr/themes/silae/hyprland/colors/colors.conf

# Ruta para editar los atajos de teclado (también puedes cambiar qué app ejecuta cada atajo)
~/.config/hypr/themes/silae/hyprland/config/keybindings.conf

# Ruta para editar la apariencia de la pantalla de bloqueo
~/.config/hypr/themes/silae/hyprlock/config/
```

---

## ✦ Configuración de hypridle

El archivo [`hypridle.conf`](./hypridle.conf) gestiona el comportamiento del sistema cuando está inactivo.

La configuración base incluye:

| Evento | Comportamiento |
|--------|---------------|
| Cerrar tapa / dormir | Bloquea la sesión (`loginctl lock-session`) |
| Despertar del sueño | Reactiva la pantalla (`hyprctl dispatch dpms on`) |

Los listeners opcionales vienen **comentados** por defecto (porque yo no los uso). Para activarlos, descomenta el bloque correspondiente en `hypridle.conf`:

```ini
# Bloquear tras 5 minutos de inactividad
listener {
    timeout = 300
    on-timeout = loginctl lock-session
}

# Apagar pantalla tras 5.5 minutos
listener {
    timeout = 330
    on-timeout = hyprctl dispatch dpms off
    on-resume  = hyprctl dispatch dpms on
}

# Suspender tras 1 hora
listener {
    timeout = 3600
    on-timeout = systemctl suspend
}
```

---

## ✦ Pantalla de bloqueo (hyprlock)

El lockscreen está completamente modularizado en `themes/silae/hyprlock/`. Cada elemento visual vive en su propio archivo:

| Módulo | Descripción |
|--------|-------------|
| `top_card.conf` | Usuario, fecha y hora |
| `logo.conf` | Icono central (por defecto: la cara de Hornet :P) |
| `bottom_card.conf` | Layout de teclado y nivel de batería |
| `input_field.conf` | Campo de contraseña |
| `background.conf` | Fondo con efecto blur |

Para modificar cualquier elemento, edita únicamente el módulo correspondiente sin afectar al resto.

---

## ✦ Licencia

Distribuido bajo la licencia **MIT**. Consulta [`LICENSE`](./LICENSE) para más información.

---

<div align="center">

*Hay que definir con el corazón*

</div>
