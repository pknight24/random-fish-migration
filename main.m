function [results] = main(nsims = 100, nt = 50)
  load("initial_temp_2013");
  initial_temps = initial_temp_2013(:,7);
  opt = 12.5;
  R = 0.05;
  results = zeros(length(initial_temps), 15);
  for i = 1:15
    initial_node = i;
    for j = 1:nsims
      results(:,i) = results(:,i) + simulate(initial_node, initial_temps, opt, nt, R);
    end
  end
  
end
