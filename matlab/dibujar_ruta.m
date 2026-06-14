function dibujar_ruta(Matriz_Costes, ruta, titulo_figura)
    % DIBUJAR_RUTA Visualiza un grafo topológico y resalta el camino óptimo
    
    % 1. Crear el objeto de grafo dirigido desde la matriz de adyacencia
    % digraph ignora automáticamente los ceros (sin conexión)
    G = digraph(Matriz_Costes);
    
    % 2. Crear la ventana de la figura
    figure('Name', titulo_figura, 'NumberTitle', 'off', 'Color', 'w');
    
    % 3. Dibujar el grafo completo (estilo base)
    % Si el grafo tiene muchos nodos (como el de 25), ocultamos los pesos
    % para que no sea un borrón de texto. Si es pequeño, los mostramos.
    % 3. Dibujar el grafo completo mostrando SIEMPRE los costes
    p = plot(G, 'EdgeLabel', G.Edges.Weight, 'NodeColor', [0.7 0.7 0.7], ...
             'EdgeColor', [0.8 0.8 0.8], 'MarkerSize', 7, 'LineWidth', 1.2);
    
    title(titulo_figura, 'FontSize', 14, 'FontWeight', 'bold');
    axis off; % Ocultar los ejes de coordenadas para que parezca un mapa limpio
    
    % 4. Resaltar la ruta óptima en rojo si existe
    if ~isempty(ruta)
        highlight(p, ruta, 'EdgeColor', 'r', 'NodeColor', 'r', 'LineWidth', 3);
    end
end