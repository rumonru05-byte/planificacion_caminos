function [coste, ruta] = aestrella_euclideo(G_euc, H, nodo_origen, nodo_destino)
    N = size(G_euc, 1);
    g = inf(1, N); g(nodo_origen) = 0;
    f = inf(1, N); f(nodo_origen) = H(nodo_origen);
    
    nodos_previos = zeros(1, N);
    visitados = false(1, N);
    
    iter = 0;
    while iter < 2000
        iter = iter + 1;
        
        f_temp = f; f_temp(visitados) = inf;
        [min_f, u] = min(f_temp);
        
        if min_f == inf || u == nodo_destino, break; end
        visitados(u) = true;
        
        for v = 1:N
            if G_euc(u, v) > 0 && ~visitados(v)
                nuevo_g = g(u) + G_euc(u, v);
                if nuevo_g < g(v)
                    nodos_previos(v) = u;
                    g(v) = nuevo_g;
                    f(v) = g(v) + H(v);
                end
            end
        end
    end
    
    % --- CORRECCIÓN AQUÍ ---
    % Comprobamos el éxito usando el coste, igual que en tu Dijkstra
    if g(nodo_destino) == inf
        coste = inf; ruta = [];
    else
        coste = g(nodo_destino); ruta = nodo_destino;
        actual = nodo_destino;
        while actual ~= nodo_origen && actual ~= 0
            actual = nodos_previos(actual);
            ruta = [actual, ruta];
        end
    end
end