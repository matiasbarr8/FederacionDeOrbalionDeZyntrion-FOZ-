## 🪐 Introducción
En el planeta **Zyntrion**, tres grandes razas compiten en el deporte más seguido de toda la galaxia: **el Orbalion**.  
Un juego de precisión y energía, donde los atletas canalizan la fuerza gravitacional del entorno para controlar esferas de plasma luminoso.

La **Federación de Orbalion de Zyntrion (FOZ)** desea desarrollar un sistema para gestionar equipos, entrenadores y tecnologías, con el fin de analizar el rendimiento de cada raza en los torneos galácticos.

---

## ⚙️ Entidades y atributos generales

### Equipos
Cada equipo pertenece a un linaje energético: **Lumínico**, **Sintético** o **Etérico**. De todos los equipos nos interesa conocer:
- **Nombre**
- **Nivel de energía base**
- **Entrenador**
- **Tecnologías complementarias** (lista de tecnologías con nombre, valor energético y estado activo/inactivo)

#### Particularidades por linaje
- **Lumínicos**: además necesitamos
  - Nivel de radiación capturada (valor numérico)
  - Nombres de los cristales solares que usan como amplificadores (lista de strings)

- **Sintéticos**: además necesitamos
  - Nivel de procesamiento central (valor numérico en teraflops)
  - Cantidad de módulos activos (valor numérico)
  - Si están o no certificados como unidad estable de competición

- **Etéricos**: además necesitan
  - Nivel de fluctuación dimensional (valor numérico)
  - Cantidad de portales energéticos abiertos (valor numérico)

---

### 👨‍🚀 Entrenadores
Cada entrenador tiene los siguientes atributos:
- Cantidad de ciclos solares de experiencia (número)
- Si está o no en sintonía con su equipo 
- Nivel de precisión estratégica (0 a 100)
- Rol: uno de los siguientes homologados por la FOZ:
  - **Estratega Cuántico**
  - **Arquitecto de Energía**
  - **Guía Mental**

> Si se intenta asignar un rol distinto a los tres homologados, se debe lanzar una excepción con el mensaje: **"Rol no homologado por la FOZ"**.

---

### 💡 Tecnologías especiales
Cada tecnología complementaria posee:
- **Nombre**
- **Valor energético** (número)
- **Activa** (booleano)

Ejemplos de tecnologías: núcleos gravitacionales, interfaces de proyección mental, cámaras de fusión energética.

---

## 📌 Requerimientos funcionales

### 1️⃣ Calcular la energía total de un equipo
- La **energía total** parte de la energía base del equipo.
- Luego se suman los valores energéticos de las tecnologías complementarias **activas**.
- Reglas adicionales:
  - **Lumínicos**: si su nivel de radiación **no supera** las 5000 unidades, obtienen un **10% adicional** sobre el total.
  - **Sintéticos**: si tienen **más de 5 módulos activos**, se aplica una **penalización del 20%** por exceso de tecnología.

#### ✅ Tests mínimos requeridos (Checkpoint 1)
- Un entrenador no puede tener tener un rol distinto a los autorizados por la FOZ.
- Un equipo lumínico con radiación > 5000 y sin tecnologías activas → su energía total es su energía base.
- Un equipo lumínico con radiación < 5000 → obtiene el bono del 10%.
- Un equipo sintético con 6 módulos → aplica correctamente la penalización del 20%.
- Un equipo sintético con 4 módulos y 2 tecnologías complementarias → suma correctamente los valores energéticos.

**Acción del estudiante:** implementar la solución hasta acá y el cálculo de energía total. Ejecutar tests. Commit & push con mensaje: `Checkpoint 1 - Energía total de equipos`.

---

### 2️⃣ Determinar si un entrenador es de élite galáctica
Un entrenador es de **élite galáctica** si cumple **ambas** condiciones:
- Tiene **más de 10 ciclos solares** de experiencia, **y**
- Cumple según su rol:
  - **Estratega Cuántico**: precisión > 80.
  - **Arquitecto de Energía**: debe estar en sintonía con el equipo.
  - **Guía Mental**: no tiene condiciones adicionales.

#### ✅ Tests requeridos (Checkpoint 2)
- Estratega cuántico con 12 ciclos y precisión 90 → es de élite galáctica.
- Arquitecto de energía con 11 ciclos pero sin sintonía → no es de élite.
- Guía mental con 15 ciclos → siempre es de élite.

**Acción del estudiante:** implementar `esEliteGalactico()` en la clase `Entrenador`. Probar los escenarios. Commit & push: `Checkpoint 2 - Entrenadores de élite galáctica`.

---

### 3️⃣ Equipos de prestigio universal
Un equipo es de **prestigio universal** según su linaje:

- **Lumínico**:
  - Tiene al menos **3 cristales solares**
  - Su entrenador es **de élite galáctica**
  - Tiene al menos **una tecnología activa**

- **Sintético**:
  - Está **certificado** como unidad estable
  - Tiene **más de 3 módulos activos**
  - **Todas** sus tecnologías están activas

#### ✅ Tests requeridos (Checkpoint 3)
- Equipo lumínico con 3 cristales, entrenador de élite y una tecnología activa → es de prestigio universal.
- Equipo sintético certificado con 4 módulos y todas las tecnologías activas → es de prestigio.
- Casos negativos para verificar que no cumple las condiciones.

**Acción del estudiante:** implementar `esDePrestigioUniversal()` en las clases correspondientes. Probar casos positivos y negativos. Commit & push: `Checkpoint 3 - Equipos de prestigio universal`.

---

### 4️⃣ Equipos Etéricos (nueva raza)
Los equipos etéricos añaden:
- **Nivel de fluctuación dimensional**
- **Cantidad de portales energéticos abiertos**

#### Reglas para Etéricos
- Prestigio universal (Etéricos) requiere:
  - Fluctuación **> 75**
  - Al menos **2 portales energéticos** abiertos
  - Al menos **2 tecnologías activas**
- Energía total:
  - Si el equipo es de prestigio universal, se le suma un **15%** adicional

#### ✅ Tests requeridos (Checkpoint 4)
- Equipo etérico con 3 portales, fluctuación 80 y 2 tecnologías activas → es de prestigio universal.
- Verificar que el incremento del 15% se aplica correctamente.
- Verificar que un equipo etérico que no cumple las condiciones **no** suma el 15%.

**Acción del estudiante:** crear la clase `EquipoEterico`, implementar la lógica extendida, ejecutar tests. Commit & push: `Checkpoint 4 - Equipos etéricos`.

---

