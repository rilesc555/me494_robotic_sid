clearvars -global;

D = 0.1;
N = 1000;

u1 = linspace(-3,3,N);
u2 = linspace(2,5,N);
iters = 100000;

norm = makedist("Normal");

params1 = zeros(iters,2);
params2 = zeros(iters,2);

for i = 1:(iters)
    n_t = randn(1000,1);

    z1 = n_t + D*u1';
    X1 = [ones(N,1), u1'];
    theta_hat1 = (X1' * X1) \ (X1' * z1);
    params1(i,:) = theta_hat1';
    
    n_t = randn(1000,1);
    z2 = n_t + D*u2';
    X2 = [ones(N,1), u2'];
    theta_hat2 = (X2' * X2) \ (X2' * z2);
    params2(i,:) = theta_hat2';
end

z1_hat = X1 * theta_hat1;
z2_hat = X2 * theta_hat2;

figure(1);
hold on;
plot(u1, z1, 'DisplayName', 'True', 'Color', 'b');
plot(u1, z1_hat, 'DisplayName', 'Estimated', 'Color', 'r');
fontsize(18, "points");
legend show;
hold off;

figure(2);
hold on;
plot(u2, z2, 'DisplayName', 'True');
plot(u2, z2_hat, 'DisplayName', 'Estimated');
fontsize(18, "points");
legend show;
hold off;


figure(3);
hold on;
y1 = params1(:,2);
x1 = params1(:,1);
scatter(x1,y1, 'DisplayName', '-3 - 3');

x2 = params2(:,1);
y2 = params2(:,2);
scatter(x2, y2, 'DisplayName', '2 - 5');

fontsize(18,"points");
legend show;
hold off;

clearvars -global;

