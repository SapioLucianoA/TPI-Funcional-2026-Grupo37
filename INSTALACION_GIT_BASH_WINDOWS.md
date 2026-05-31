---

## 📥 Guía de Instalación y Configuración de Git Bash (Windows)

Para poder clonar el repositorio y trabajar con las ramas en tu computadora, necesitamos instalar y configurar **Git Bash**. Seguí estos pasos detallados:

### 1. Descarga del instalador
1. Entrá a la página oficial de Git: [git-scm.com/downloads](https://git-scm.com/downloads)
2. Hacé clic en el botón **"Download for Windows"**.
3. Elegí la opción **"64-bit Git for Windows Setup"** para descargar el instalador `.exe`.

### 2. Pasos clave durante la instalación
Ejecutá el archivo descargado. Podés darle a **"Next"** (Siguiente) a las opciones por defecto, pero prestá especial atención a este apartado:
* **Choosing the default editor used by Git:** Por defecto viene seleccionado un editor de terminal llamado *Vim* (que es complejo de usar si no lo conocés). Se recomienda abrir la lista desplegable y seleccionar tu editor de texto de preferencia (como **Sublime Text**, VS Code, etc.). De esta manera, si Git necesita resolver un conflicto, abrirá el archivo cómodamente en tu editor.

Seguí haciendo clic en **"Next"** hasta llegar al botón **"Install"** y esperá a que finalice el proceso.

### 3. Verificación
Para comprobar que quedó correctamente instalado:
1. Andá a cualquier carpeta de tu computadora (por ejemplo, el Escritorio).
2. Hacé **clic derecho** en un espacio vacío.
3. Deberías ver la opción **"Open Git Bash here"** (en Windows 11 puede figurar dentro de *"Mostrar más opciones"*).
4. Al seleccionarla, se abrirá la terminal negra lista para escribir comandos.

---

### 👤 4. Configuración Inicial Obligatoria (Se hace una sola vez)
Antes de clonar el proyecto o subir cualquier cambio, Git necesita saber quién sos para registrar correctamente tus aportes en el historial de commits del repositorio.

Abrí Git Bash y ejecutá estos dos comandos (reemplazando los textos entre comillas con tus datos reales y presionando *Enter* después de cada uno):

```bash
git config --global user.name "Tu Nombre y Apellido"
```

```bash
git config --global user.email "tu-correo@ejemplo.com"
```

> 💡 **Nota importante:** Usá el mismo correo electrónico con el que te registraste en tu cuenta de GitHub. Esto garantiza que la plataforma reconozca tus contribuciones en los gráficos del proyecto.