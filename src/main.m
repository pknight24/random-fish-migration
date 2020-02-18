function [results] = main(nt, month, R)
  load("initial_temp_2013");
  initial_temps = initial_temp_2013(:,month);
  opt = 12;
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
