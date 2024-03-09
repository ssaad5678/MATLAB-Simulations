% Program to perform linear regression on a synthetic dataset

% Generate synthetic dataset
rand('seed', 42); % Set random seed for reproducibility in Octave
X = 10 * rand(100, 1); % Generate random input features
noise = 2 * randn(100, 1); % Generate random noise
y = 3 * X + 5 + noise; % Generate output variable with linear relationship

% Add a column of ones to X to represent the intercept term
X = [ones(length(X), 1), X];

% Perform linear regression using normal equations
theta = (X' * X) \ (X' * y);

% Print the parameters of the linear regression model
fprintf('Intercept (theta0): %f\n', theta(1));
fprintf('Slope (theta1): %f\n', theta(2));

% Plot the synthetic dataset and the linear regression line
scatter(X(:, 2), y, 'MarkerEdgeColor', 'b');
hold on;
y_pred = X * theta;
plot(X(:, 2), y_pred, '-r', 'LineWidth', 2);
hold off;
xlabel('Input feature');
ylabel('Output variable');
title('Linear Regression on Synthetic Dataset');
legend('Training data', 'Linear regression line');
