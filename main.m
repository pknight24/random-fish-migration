function [results] = main(nsims = 100)
  initial_temps = randn(15, 1) .* 2 .+ 10
  initial_node = 14
  opt = 1
  R = 0.01;
  nt = 5;
  results = zeros(length(initial_temps), 1);
  for i = 1:nsims
    results = results + simulate(initial_node, initial_temps, opt, nt, R);
  end
  
end

