# 🗺️ Planificación de Caminos y Navegación Autónoma en Robots Móviles

Este repositorio contiene la implementación en **MATLAB** de los algoritmos clásicos de búsqueda en grafos para la planificación de trayectorias en robótica móvil: **Dijkstra** (búsqueda desinformada) y **A*** (búsqueda informada). Además, incluye la implementación de un sistema completo de navegación autónoma para robótica móvil, integrando algoritmos clásicos de planificación global (búsqueda desinformada e informada en grafos) con métodos reactivos de evasión local de obstáculos (navegación por campos potenciales: [nav_campos_potenciales.git](https://github.com/rumonru05-byte/nav_campos_potenciales)).

Estos algoritmos permiten calcular la ruta óptima de menor coste entre dos localizaciones separadas por largas distancias utilizando mapas topológicos.

> _**Nota:** El desarrollo detallado de los algoritmos, el análisis teórico de la admisibilidad heurística, la comparativa de resultados experimentales y la resolución de las cuestiones planteadas se encuentran disponibles en la **[Wiki de este repositorio](https://github.com/rumonru05-byte/planificacion_caminos/wiki)**._

---

## 📂 Contenido del Repositorio

### Práctica 5: Algoritmo Dijkstra
* `dijkstra.m`: Función principal que implementa el algoritmo de búsqueda de coste uniforme.
* `test_dijkstra.m`: Script de validación con casos de prueba para grafos asimétricos.
* `dibujar_ruta.m`: Función auxiliar para la visualización gráfica de los mapas topológicos.
* `grafos.mat`: Archivo de datos con las matrices de costes reales y heurísticas de prueba.

### Práctica 6: Algoritmo A*
* `aestrella.m`: Función principal que implementa el algoritmo A* utilizando matrices heurísticas.
* `test_aestrella.m`: Script de validación sobre la importancia de la admisibilidad heurística.

### Práctica 7: Navegación Autónoma (Integración Global-Local)
* `navegacion_autonoma_aestrella.m`: Orquestador principal que une la planificación global sobre el mapa y la ejecución del movimiento del robot.
* `campos_potenciales.m`: Algoritmo de navegación local reactiva para evasión de obstáculos.
* `aestrella_euclideo.m`: Versión optimizada de A* que calcula heurísticas dinámicas basadas en distancias físicas reales para garantizar consistencia.
* `dijkstra.m`: Función principal que implementa el algoritmo de búsqueda de coste uniforme.
* `mapa2.m` y `mapa2.pgm`: Entorno de simulación laberíntico de alta densidad de obstáculos.

---

## 🚀 Compilación y Ejecución

### 1. Clonar el repositorio
Abre tu terminal y ejecuta el siguiente comando para descargar el código en tu equipo:
```bash
git clone https://github.com/rumonru05-byte/planificacion_caminos.git
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
5. Para lanzar el Sistema de Navegación Autónoma por Dijkstra, escribe en la consola:
```bash
navegacion_autonoma
```
6. Para lanzar el Sistema de Navegación Autónoma por A*, escribe en la consola:
```bash
navegacion_autonoma_aestrella
```
&emsp;&emsp; _En ambos casos deberás introducir el nodo de origen y el de destino deseados._

---

> _Desarrollado para la asignatura de Ampliación de Robótica - Universidad de Málaga (UMA)._







