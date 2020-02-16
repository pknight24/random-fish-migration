function [results] = main(nt = 50)
  load("initial_temp_2013");
  initial_temps = initial_temp_2013(:,5);
  opt = 12;
  R = 0.05;
  conditional_results = zeros(15, 15);
  results = zeros(15,1);
  for i = 1:15
    initial_node = i;
    conditional_results(:,i) = simulate(initial_node, initial_temps, opt, nt, R);
  end
  for i = 1:15
    results(i) = sum(conditional_results(i,:)) .* (1/15);
  end
  
end
