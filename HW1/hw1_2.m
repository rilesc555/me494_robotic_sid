N = 100;
u = linspace(0, 1, N);
y = tan(u * 0.9 * pi / 2);

% Initialize storage for parameters
theta_all = cell(2, 20);

for n = 1:20
    % Construct the matrix of the model
    U = zeros(N, n + 1);
    for i = 0:n
        U(:, i+1) = u'.^i;
    end
    
    theta = (U' * U) \ (U' * y');
    theta_all{1,n} = theta;
    
    y_hat = U * theta;    
    theta_all{2,n} = y_hat;
end

% Plot true vs estimated output
figure;
hold on;
n_values = [1, 5, 10, 15];
colors = ['r', 'g', 'b', 'm'];
for i = 1:length(n_values)
    n = n_values(i);
    theta = theta_all{1,n};
    y_hat = theta_all{2,n};
    plot(u, y_hat, colors(i), 'DisplayName', sprintf('n = %d', n), 'LineWidth', 1.5);
end
plot(u, y, 'k', 'LineWidth', 1.5, 'DisplayName', 'True y');
leg = legend();
fontsize(leg,18,'points')
xlabel('input');
ylabel('output');
title('Estimated vs True Output');
hold off;