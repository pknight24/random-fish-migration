function [P] = build_p(current_temps, opt)
  n = length(current_temps);
  P = zeros(n,n);
  for i = 1:n
    probs = zeros(n); % create the probability vector corresponding to node i
    scores = compute_scores(i, current_temps, opt); % compute relative scores
    scores(scores <= 0) = 0; % remove the bad scores
    scores(1 - get_adj()(:,i)) = 0; % filter out the nodes that are not connected
    total = sum(scores);
    if total == 0
      probs(i) = 1; % if there are no superior nodes, we stay at the current node
    else
      for j =  1:n
	probs(j) = scores(j) / total; % otherwise, use the score to create a probability
      end
    end
    P(:,i) = probs;
  end
end


% score all of the nodes with respect to node i
function [scores] = compute_scores(i, current_temps, opt)
  scores = zeros(length(current_temps));
  for j = 1:length(current_temps) 
      score(j) = abs(current_temps[i] - opt) - abs(current_temps[j] - opt);
    end
end

