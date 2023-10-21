function calc_pi()

st_tock = 100:100:10000;
priblizek_pi = zeros(1, length(st_tock));
napaka = zeros(1, length(st_tock));

% Definicija anonimne funkcije za izračun y-koordinat na loku krožnice
kroznica = @(x, r) sqrt(r^2 - x.^2);
r=1;
for i = 1:length(st_tock)
    [points_in_circle, points_in_square] = mcc_pi(st_tock(i));
    
    % Ocena za π in izračun napake
    priblizek_pi(i) = area_pi(points_in_circle, points_in_square);
    napaka(i) = abs(priblizek_pi(i) - pi);
    
    fprintf('Število točk: %d, Ocena za π: %.6f, Napaka: %.6f\n', st_tock(i), priblizek_pi(i), napaka(i));
    
    
    if st_tock(i) == 5000
        % Preveri, ali so točke znotraj loka krožnice
        y_values = kroznica(points_in_square(1, :), 1);
        inside_circle = abs(points_in_square(2, :)) <= abs(y_values);
        
        % Izris točk znotraj in zunaj kroga ter loka krožnice
        figure;
        plot(points_in_square(1, inside_circle), points_in_square(2, inside_circle), 'go', 'MarkerSize', 6); % Točke znotraj kroga (modra barva)
        hold on;
        plot(points_in_square(1, ~inside_circle), points_in_square(2, ~inside_circle), 'y*', 'MarkerSize', 6); % Točke zunaj kroga (rdeča barva)
        
        % Risanje loka krožnice
        r = 1;
        x = linspace(-r, r, 1000); % Interval x od -r do r
        y_positive = kroznica(x, r); % Pozitivna y vrednost krožnice
        y_negative = -kroznica(x, r); % Negativna y vrednost krožnice

        plot(x, y_positive, 'k', 'LineWidth', 2); % Del krožnice z y > 0
        plot(x, y_negative, 'k', 'LineWidth', 2); % Del krožnice z y < 0
        
        axis equal;
        ...................
        hold off;
    end
end

% Izris rezultatov
figure;
plot(st_tock, napaka, '-o');
xlabel('Število naključnih točk');
ylabel('Napaka od π');
title('Približevanje vrednosti π z Monte Carlo metodo');
grid on;

end

function estimated_pi = area_pi(points_in_circle, points_in_square)
    ratio = size(points_in_circle, 2) / size(points_in_square, 2);
    estimated_pi = ratio * 4; % Ker je razmerje ploščin kroga in kvadrata π/4
end