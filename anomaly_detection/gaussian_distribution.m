% function probability = gaussian_distribution(X, mean_value, variance)
%     % probability = 0;
%     [m n] = size(X);
%     probability = zeros(m, 1);
%     for i = 1 : m
%       a = (2 * pi) ^ (n / 2) * det(variance) ^ (1 / 2);
%       b = (-1/2) * (X(i, :) - mean_value) * inv(variance) * (X(i, :) - mean_value)';
%       probability(i) = (1 / a) * exp(b);
%     endfor
% endfunction

% Am lasat codul pentru aceasta functie, dar ea nefiind testata de checker, am 
% implementat totul direct in functia multivariate gaussian