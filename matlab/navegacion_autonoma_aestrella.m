function navegacion_autonoma_aestrella()
    clear; clc;
    
    % 1. Cargar datos
    mapa2; 
    coords = nodos(:, 2:3);
    G_orig = costes; 
    
    % 2. Construir matriz de costes euclídeos
    G_euc = zeros(size(G_orig));
    for i = 1:size(G_orig, 1)
        for j = 1:size(G_orig, 2)
            if G_orig(i, j) > 0
                G_euc(i, j) = norm(coords(i, :) - coords(j, :));
            end
        end
    end
    
    % 3. Interacción
    nodo_origen = input('Nodo origen (1-49): ');
    nodo_destino = input('Nodo destino (1-49): ');
    
    % 4. Heurística
    H = zeros(1, size(coords, 1));
    for i = 1:size(coords, 1)
        H(i) = norm(coords(i, :) - coords(nodo_destino, :));
    end
    
    % 5. Ejecutar A*
    fprintf('Calculando A*...\n');
    [~, ruta] = aestrella_euclideo(G_euc, H, nodo_origen, nodo_destino);
    
    if isempty(ruta)
        disp('Error: A* no encontró ruta (posible mínimo local en el grafo o heurística inadmisible).'); 
        return;
    end
    
    % 6. Navegación Local
    mapa_img = imread('mapa2.pgm');
    mapa_bin = binaryOccupancyMap(imbinarize(imcomplement(mapa_img)), 1); 
    show(mapa_bin); hold on;
    
    for i = 1:length(ruta)-1
        [exito, path] = campos_potenciales(mapa_bin, coords(ruta(i), :), coords(ruta(i+1), :));
        plot(path(:,1), path(:,2), 'r', 'LineWidth', 2);
        drawnow;
        if ~exito
            disp(['Atascado entre nodo ', num2str(ruta(i)), ' y ', num2str(ruta(i+1))]);
            break; 
        end
    end
end