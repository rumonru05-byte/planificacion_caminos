% SCRIPT DE PRUEBA: Validación del Algoritmo de Dijkstra

%% PRUEBA 1: Grafo de ejemplo básico (7 nodos)
clc; clear;
disp('--- PRUEBA 1: Grafo Básico (7 Nodos) ---');
G_simple = [
    0 2 0 0 9 0 0;
    2 0 1 2 0 0 0;
    0 1 0 5 0 0 0;
    0 2 5 0 1 2 4;
    9 0 0 1 0 4 0;
    0 0 0 2 4 0 1;
    0 0 0 4 0 1 0
]; % [cite: 405-429]

[coste_s, ruta_s] = dijkstra(G_simple, 1, 7);
disp(['Resultado esperado: Coste = 7, Ruta = [1 2 4 6 7]']); % [cite: 430, 431]
disp(['Resultado obtenido: Coste = ', num2str(coste_s), ', Ruta = [', strtrim(sprintf('%d ', ruta_s)), ']']);
disp(' ');

%% PRUEBA 2: Grafo complejo (25 nodos)
disp('--- PRUEBA 2: Grafo Complejo (Archivo grafos.mat) ---');
% Asegúrate de tener el archivo grafos.mat en la misma carpeta
load('grafos.mat'); % Esto cargará la matriz J en el Workspace [cite: 494]

casos_prueba = [
    1, 19;
    19, 1;
    25, 19;
    19, 25;
    1, 23;
    23, 1;
    1, 24;
    23, 22
];

for i = 1:size(casos_prueba, 1)
    origen = casos_prueba(i, 1);
    destino = casos_prueba(i, 2);
    
    [c, r] = dijkstra(J, origen, destino);
    
    disp(['De nodo ', num2str(origen), ' a nodo ', num2str(destino), ':']);
    disp(['  Coste = ', num2str(c)]);
    disp(['  Ruta  = [', strtrim(sprintf('%d ', r)), ']']);
    disp('-----------------------------------');
end

%% --- GENERACIÓN DE IMÁGENES PARA LA WIKI ---
disp('Generando visualizaciones de los grafos...');

% 1. Visualizar el grafo simple (Ruta del 1 al 7)
dibujar_ruta(G_simple, ruta_s, 'Grafo Básico (7 Nodos) - Ruta 1 a 7');

% 2. Visualizar una ruta del grafo complejo (Por ejemplo, del 1 al 19)
[~, ruta_1_19] = dijkstra(J, 1, 19);
dibujar_ruta(J, ruta_1_19, 'Grafo Complejo (25 Nodos) - Ruta 1 a 19');

% 3. Visualizar el concepto de Asimetría (Ruta de vuelta del 19 al 1)
[~, ruta_19_1] = dijkstra(J, 19, 1);
dibujar_ruta(J, ruta_19_1, 'Grafo Complejo - Asimetría (Ruta 19 a 1)');
