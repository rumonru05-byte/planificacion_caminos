# 🗺️ Planificación de Caminos en Robots Móviles (Dijkstra y A*)

Este repositorio contiene la implementación en **MATLAB** de los algoritmos clásicos de búsqueda en grafos para la planificación de trayectorias en robótica móvil: **Dijkstra** (búsqueda desinformada) y **A*** (búsqueda informada).

Estos algoritmos permiten calcular la ruta óptima de menor coste entre dos localizaciones separadas por largas distancias utilizando mapas topológicos.

> _**Nota:** El desarrollo detallado de los algoritmos, el análisis teórico de la admisibilidad heurística, la comparativa de resultados experimentales y la resolución de las cuestiones planteadas se encuentran disponibles en la **[Wiki de este repositorio](https://github.com/rumonru05-byte/planificacion_caminos/wiki)**._

---

## 📂 Contenido del Repositorio
* `dijkstra.m`: Función principal que implementa el algoritmo de búsqueda de coste uniforme.
* `aestrella.m`: Función principal que implementa el algoritmo A* utilizando matrices heurísticas.
* `test_dijkstra.m` / `test_aestrella.m`: Scripts de validación con los casos de prueba exigidos.
* `dibujar_ruta.m`: Función auxiliar para la visualización gráfica de los mapas topológicos y el trazado de la ruta.
* `grafos.mat`: Archivo de datos con las matrices de costes reales ($G$) y heurísticas ($H$).

---

## 🚀 Compilación y Ejecución

### 1. Clonar el repositorio
Abre tu terminal y ejecuta el siguiente comando para descargar el código en tu equipo:
```bash
git clone [https://github.com/rumonru05-byte/planificacion_caminos.git](https://github.com/rumonru05-byte/planificacion_caminos.git)
cd planificacion_caminos
```

### 2. Ejecución en MATLAB
1. Abre MATLAB y navega hasta la carpeta del repositorio clonado.
2. Asegúrate de que el archivo grafos.mat se encuentra en el mismo directorio que los scripts.
3. Para evaluar el algoritmo de Dijkstra, escribe en la Command Window:
```bash
run('test_dijkstra.m')
```
4. Para ejecutar el algoritmo A* y comprobar la importancia de la admisibilidad heurística:
```bash
run('test_aestrella.m')
```

---

> _Desarrollado para la asignatura de Ampliación de Robótica - Universidad de Málaga (UMA)._







