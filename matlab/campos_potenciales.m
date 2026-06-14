function [exito, path] = campos_potenciales(mapa, origen, destino)
    % Parámetros
    v = 0.5; D = 3; alfa = 0.5; beta = 10; % Ajustados para un mapa de imagen
    max_rango = 5;
    angulos = -pi/2:(pi/18):pi/2;
    
    robot = [origen, 0];
    path = [robot(1:2)];
    iteracion = 0;
    
    while norm(destino - robot(1:2)) > 1 && iteracion < 1000
        % 1. Lidar (usando el objeto mapa)
        obs = rayIntersection(mapa, robot, angulos, max_rango);
        
        % 2. Atracción
        F_atr = alfa * (destino - robot(1:2));
        
        % 3. Repulsión
        F_rep = [0, 0];
        for i = 1:size(obs, 1)
            if ~isnan(obs(i,1)) 
                vec_rep = robot(1:2) - obs(i, :);
                dist_obs = norm(vec_rep);
                if dist_obs < D && dist_obs > 0
                    u_rep = vec_rep / dist_obs;
                    F_rep = F_rep + (beta * (1/dist_obs - 1/D) * (1/dist_obs^2)) * u_rep;
                end
            end
        end
        
        % 4. Movimiento
        F_res = F_atr + F_rep;
        theta = atan2(F_res(2), F_res(1));
        robot(1:2) = robot(1:2) + v * [cos(theta), sin(theta)];
        
        path = [path; robot(1:2)];
        iteracion = iteracion + 1;
    end
    exito = (iteracion < 1000);
end