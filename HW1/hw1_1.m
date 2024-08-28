y = load("HW1/" + "hw1_timber.mat");
true_data = y.timber.rollrate;

X = ones(length(true_data), 3);
X(:, 2) = y.timber.roll;
X(:, 3) = y.timber.aileron;

theta_hat = (X' * X) \ (X' * true_data);
y_hat = X * theta_hat;

figure;
hold on;
plot(y.timber.t, true_data, 'DisplayName', 'True Roll Rate')
plot(y.timber.t, y_hat, 'DisplayName', 'Estimated Roll Rate')
leg = legend();
fontsize(leg,18,'points')
hold off;
