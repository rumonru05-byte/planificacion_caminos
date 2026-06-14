function navegacion_autonoma()
    % 1. Carga de datos
    % Ejecutamos mapa2.m para cargar 'nodos' y 'costes' en el workspace
    mapa2; 
    G = costes; 
    
    % Carga y procesamiento del mapa de imagen
    mapa_img = imread('mapa2.pgm');
    % Convertimos a mapa binario. Resolución 1 píxel/unidad
    mapa_bin = binaryOccupancyMap(imbinarize(imcomplement(mapa_img)), 1); 
    
    % 2. Interacción con el usuario (Requisito 1)
    fprintf('--- Navegación Autónoma ---\n');
    nodo_origen = input('Introduce el nodo de inicio (1-49): ');
    nodo_destino = input('Introduce el nodo de destino (1-49): ');
    
    % 3. Planificación Global (Dijkstra)
    [~, ruta] = dijkstra(G, nodo_origen, nodo_destino);
    
    if isempty(ruta)
        disp('Error: No se ha podido encontrar un camino en el grafo.'); 
        return;
    end
    
    % 4. Navegación Local (Campos Potenciales)
    show(mapa_bin); hold on;
    title(['Trayectoria del Nodo ', num2str(nodo_origen), ' al ', num2str(nodo_destino)]);
    
    % Extraemos coordenadas (columna 2=X, columna 3=Y)
    coords = nodos(:, 2:3); 
    
    for i = 1:length(ruta)-1
        origen_local = double(coords(ruta(i), :));
        destino_local = double(coords(ruta(i+1), :));
        
        % Llamada a campos potenciales
        [exito, path] = campos_potenciales(mapa_bin, origen_local, destino_local);
        
        % Representación gráfica
        plot(path(:,1), path(:,2), 'r', 'LineWidth', 2);
        drawnow;
        
        if ~exito
            disp(['Error: Atascado en un mínimo local entre el nodo ', num2str(ruta(i)), ' y ', num2str(ruta(i+1))]);
            disp('¿Posible causa?: El pasillo es demasiado estrecho o hay un obstáculo no mapeado.');
            return;
        end
    end
    
    disp('¡Destino alcanzado con éxito!');
end