% SCRIPT DE PRUEBA: Algoritmo A* (Práctica 6)
clc; clear;

%% MATRICES ORIGINALES DEL GUION
G = [
    0 2 0 0 9 0 0;
    2 0 1 2 0 0 0;
    0 1 0 5 0 0 0;
    0 2 5 0 1 2 4;
    9 0 0 1 0 4 0;
    0 0 0 2 4 0 1;
    0 0 0 4 0 1 0
]; % [cite: 275-290]

H = [
    0 2 5 5 5 6 9;
    2 0 2 3 6 6 8;
    5 2 0 2 6 6 7;
    5 3 2 0 5 4 6;
    5 6 6 5 0 1 5;
    6 6 6 4 1 0 1;
    9 8 7 6 5 1 0
]; % [cite: 344-359]

%% TAREA 1: Prueba de funcionamiento básico (1 a 7)
disp('--- TAREA 1: A* del nodo 1 al 7 ---');
[c1, r1] = aestrella(G, H, 1, 7); % [cite: 267]
disp(['Resultado esperado : Coste = 7, Ruta = [1 2 4 6 7]']); % [cite: 297-298]
disp(['Resultado obtenido : Coste = ', num2str(c1), ', Ruta = [', strtrim(sprintf('%d ', r1)), ']']);
disp('-----------------------------------');
disp(' ');

%% TAREA 2: El problema de la Heurística No Admisible (7 a 4)
disp('--- TAREA 2: A* del nodo 7 al 4 (Con H original) ---');
[c2, r2] = aestrella(G, H, 7, 4); % [cite: 361]
disp(['Resultado obtenido : Coste = ', num2str(c2), ', Ruta = [', strtrim(sprintf('%d ', r2)), ']']);
disp('ANÁLISIS:');
disp('El algoritmo devuelve la ruta directa [7 4] con coste 4.');
disp('Sin embargo, la ruta óptima real es [7 6 4] con coste 3 (7->6=1, 6->4=2).');
disp('Esto ocurre porque la heurística sobreestima el coste real. H(6,4)=4, pero el coste real de 6 a 4 es 2. No cumple h*(n) <= h(n).'); %
disp('-----------------------------------');
disp(' ');

%% TAREA 3: Proponer una Heurística Admisible
disp('--- TAREA 3: Heurística Admisible (Corregida) ---');
% 
% Para que la heurística sea admisible, sus valores NUNCA deben superar
% el coste real del camino más corto. 
% Vamos a modificar la columna 4 de H para que contenga los costes REALES mínimos al nodo 4.
H_admisible = H;
% Costes reales mínimos hacia el nodo 4 calculados a mano:
% 1->4: 4 | 2->4: 2 | 3->4: 5 | 4->4: 0 | 5->4: 1 | 6->4: 2 | 7->4: 3
H_admisible(:, 4) = [4; 2; 5; 0; 1; 2; 3];

[c3, r3] = aestrella(G, H_admisible, 7, 4);
disp(['Resultado con H admisible : Coste = ', num2str(c3), ', Ruta = [', strtrim(sprintf('%d ', r3)), ']']);
disp('Al corregir la heurística, A* ahora sí encuentra el camino óptimo.');
disp('-----------------------------------');