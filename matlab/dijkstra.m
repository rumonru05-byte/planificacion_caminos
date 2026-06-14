function [coste, ruta] = dijkstra(G, nodo_origen, nodo_destino)
    % DIJKSTRA Calcula la ruta óptima y su coste mínimo en un grafo.
    % Entradas:
    %   G            - Matriz de adyacencia/costes (NxN)
    %   nodo_origen  - Identificador del nodo de partida
    %   nodo_destino - Identificador del nodo de llegada
    % Salidas:
    %   coste        - Valor numérico del coste total mínimo
    %   ruta         - Vector con la secuencia de nodos visitados
    
    N = size(G, 1); % Número total de nodos en el grafo
    
    % Inicialización
    costes = inf(1, N);         % Vector de costes mínimos conocidos [cite: 621]
    costes(nodo_origen) = 0;    % El coste al nodo origen es 0
    nodos_previos = zeros(1, N); % Para reconstruir la ruta final
    visitados = false(1, N);    % Nodos ya evaluados definitivamente
    
    % Bucle principal de búsqueda
    for iter = 1:N
        % 1. Extraer el nodo no visitado con el menor coste actual
        coste_minimo = inf;
        u = -1;
        for i = 1:N
            if ~visitados(i) && costes(i) < coste_minimo
                coste_minimo = costes(i);
                u = i;
            end
        end
        
        % Condiciones de parada prematura
        if u == -1 || u == nodo_destino
            % Si no quedan nodos alcanzables (u=-1) o llegamos al destino, paramos
            break;
        end
        
        % Marcar el nodo actual como visitado
        visitados(u) = true;
        
        % 2. Evaluar y relajar los costes de los nodos vecinos
        for v = 1:N
            % Si hay una arista hacia 'v' (coste > 0) y 'v' no ha sido visitado
            if G(u, v) > 0 && ~visitados(v)
                nuevo_coste = costes(u) + G(u, v);
                % Si encontramos un camino más corto, lo actualizamos
                if nuevo_coste < costes(v)
                    costes(v) = nuevo_coste;
                    nodos_previos(v) = u;
                end
            end
        end
    end
    
    % 3. Reconstrucción de la ruta óptima
    if costes(nodo_destino) == inf
        % Si el coste sigue siendo infinito, el destino es inalcanzable [cite: 566]
        coste = inf;
        ruta = [];
    else
        % Si se ha encontrado ruta, hacer "backtracking" desde el destino
        coste = costes(nodo_destino);
        ruta = nodo_destino;
        nodo_actual = nodo_destino;
        
        while nodo_actual ~= nodo_origen
            nodo_actual = nodos_previos(nodo_actual);
            ruta = [nodo_actual, ruta]; % Añadimos el nodo al principio del vector
        end
    end
end