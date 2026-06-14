function [coste, ruta] = aestrella(G, H, nodo_origen, nodo_destino)
    % AESTRELLA Calcula la ruta óptima usando el algoritmo A*.
    % Entradas:
    %   G            - Matriz de costes reales (NxN)
    %   H            - Matriz de heurística estimada (NxN)
    %   nodo_origen  - Identificador del nodo de partida
    %   nodo_destino - Identificador del nodo de llegada
    % Salidas:
    %   coste        - Valor numérico del coste total
    %   ruta         - Vector con la secuencia de nodos visitados
    
    N = size(G, 1);
    
    % g_score: Coste real acumulado desde el origen hasta el nodo 'n'
    g_score = inf(1, N);
    g_score(nodo_origen) = 0;
    
    % f_score: Coste total estimado (f = g + h)
    f_score = inf(1, N);
    f_score(nodo_origen) = H(nodo_origen, nodo_destino);
    
    nodos_previos = zeros(1, N);
    visitados = false(1, N); % Lista cerrada
    
    for iter = 1:N
        % 1. Buscar el nodo no visitado con el menor f_score (la promesa más barata)
        min_f = inf;
        u = -1;
        for i = 1:N
            if ~visitados(i) && f_score(i) < min_f
                min_f = f_score(i);
                u = i;
            end
        end
        
        % Si no hay ruta posible o hemos llegado al destino (y es el de menor f)
        if u == -1 || u == nodo_destino
            break;
        end
        
        % Marcar como visitado
        visitados(u) = true;
        
        % 2. Evaluar vecinos
        for v = 1:N
            if G(u, v) > 0 && ~visitados(v)
                % Coste real para llegar a 'v' pasando por 'u'
                tentative_g = g_score(u) + G(u, v);
                
                % Si encontramos un camino real más corto, actualizamos
                if tentative_g < g_score(v)
                    nodos_previos(v) = u;
                    g_score(v) = tentative_g;
                    % Actualizamos el f_score sumando la heurística hasta el destino
                    f_score(v) = g_score(v) + H(v, nodo_destino);
                end
            end
        end
    end
    
    % 3. Reconstruir la ruta
    if g_score(nodo_destino) == inf
        coste = inf;
        ruta = [];
    else
        coste = g_score(nodo_destino);
        ruta = nodo_destino;
        nodo_actual = nodo_destino;
        
        while nodo_actual ~= nodo_origen
            nodo_actual = nodos_previos(nodo_actual);
            ruta = [nodo_actual, ruta];
        end
    end
end