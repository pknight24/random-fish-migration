function [final] = simulate(initial_node, initial_temps, opt, nt, R)
  n = length(initial_temps);
  position_vec = zeros(n, 1);
  position_vec(initial_node) = 1;
  P = build_p(initial_temps, opt);
  for t = 1:nt

    % first we need to compute the probability vector, and take a step towards one of the nodes
    prob_vector = P * position_vec;
    interval_vector = cumsum(prob_vector);
    guess = rand(1);
    for i = 1:n
      if i == 1
	if guess < interval_vector(i)
	  next_node = 1
	end
      elseif (interval_vector(i - 1) < guess) && (guess < interval_vector(i))
	next_node = i
      end
    end
    position_vec = zeros(n,1);
    position_vec(next_node) = 1;
	  
    % now update the temperatures and the P matrix
    current_temps = update_temps(initial_temps, R);
    P = build_p(current_temps, opt);
    if t == nt
      ended_on = next_node
    end
    
  end
  final = position_vec; % return the final position vector
    
end
