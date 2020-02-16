function [final] = simulate(initial_node, initial_temps, opt, nt, R)
  n = length(initial_temps);
  prob_vec = zeros(n, 1);
  prob_vec(initial_node) = 1; % initial probability of 1 in the starting node
  P = build_p(initial_temps, opt);
  current_temps = initial_temps;
  for t = 1:nt

    prob_vec = P * prob_vec; % now all we care about is the probability vector
    % interval_vector = cumsum(prob_vector);
    % guess = rand(1);
    % for i = 1:n
    %   if i == 1
    % 	if guess < interval_vector(i)
    % 	  next_node = 1;
    % 	end
    %   elseif (interval_vector(i - 1) < guess) && (guess < interval_vector(i))
    % 	next_node = i;
    %   end
    % end
    % position_vec = zeros(n,1);
    % position_vec(next_node) = 1;
	  
    % now update the temperatures and the P matrix
    current_temps = update_temps(current_temps, R);
    P = build_p(current_temps, opt);
  end
  final = prob_vec; % return the final position vector
    
end
