function [results] = main(nsims = 100)
  temps;
  initial_temps = JAN;
  opt = 12.5
  R = 0.01;
  nt = 50;
  results = zeros(length(initial_temps), 15);
  for i = 1:15
    initial_node = i
    for j = 1:nsims
      results(:,i) = results(:,i) + simulate(initial_node, initial_temps, opt, nt, R);
    end
  end
  
end

