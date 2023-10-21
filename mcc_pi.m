function [points_in_circle, points_in_square] = mcc_pi(num_points)
    % Generiraj naključne točke v kvadratu
    x = rand(1, num_points);
    y = rand(1, num_points);

    % Preveri, ali so točke znotraj kroga
    r = sqrt(x.^2 + y.^2);
    inside_circle = r <= 1;

    % Loči točke znotraj kroga in kvadrata
    points_in_circle = [x(inside_circle); y(inside_circle)];
    points_in_square = [x; y];

end