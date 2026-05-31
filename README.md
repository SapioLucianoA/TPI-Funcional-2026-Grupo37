# 💻 Trabajo-Integrador-Paradigmas


---

## 🛠️ Guía rápida de Git para el equipo

### 📥 1. Primera vez (Descargar el proyecto)
Este comando se ejecuta **una sola vez** para descargar el repositorio a tu computadora:

```bash
git clone <https://github.com/SapioLucianoA/Trabajo-Integrador-Paradigmas>
```

---

### 🔄 2. Flujo de trabajo diario

> **🛑 REGLA DE ORO:** Nunca trabajamos directamente en la rama `main`.

#### Paso 1: Crear y usar una rama propia
Para empezar una nueva tarea, creá tu propia rama y movete a ella para trabajar seguro:
```bash
git checkout -b nombre-de-tu-rama
```
*(Ejemplo: `git checkout -b feature-calculos`)*

#### Paso 2: Guardar tus cambios
A medida que vayas avanzando con tu parte, guardá tu progreso localmente:
```bash
git add . 
git commit -m "Descripción clara de lo que hiciste"
```

#### Paso 3: Actualizar antes de subir (🚨 ¡El paso más importante!)
Antes de "pushear" (mandar) tu código a GitHub, nos traemos (`pull`) lo que hay en el main. Esto evita conflictos con el trabajo de los demás:
```bash
git pull origin main
```
*(Nota: Si hay conflictos, resolvelos en tu editor, guardá los archivos y volvé a hacer `add` y `commit`).*

#### Paso 4: Subir tu rama a GitHub
Una vez que tu código esté actualizado y funcionando bien, subí tu rama a la nube:
```bash
git push origin nombre-de-tu-rama
```

```bash
https://github.com/SapioLucianoA/Trabajo-Integrador-Paradigmas  
```

