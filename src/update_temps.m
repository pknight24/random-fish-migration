function [new_temps] = update_temps(current_temps, R)
% south_rankings = [1 2 15 3 14 13 5 4 12 11 6 8 10 9 7]; % value is node, index is ranking
  south_rankings = [1 2 4 8 7 11 15 12 14 13 10 9 6 5 3]; % index is node, value is ranking
  add_rate_increase = linspace(0.025, 0, 15)(south_rankings);
  new_temps = current_temps .+ R + add_rate_increase';
end

