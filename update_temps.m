function [new_temps] = update_temps(current_temps, R)
  new_temps = current_temps .+ f(R);
end

function [fR] = f(R)
  fR = R;
end
