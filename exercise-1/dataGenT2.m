function [Rarr, Farr] = dataGenT2(narr, p)
  Rarr = [];
  Farr = [];
  for n = narr
    if n>100; disp('calculating accuracy for n task 2: '); disp(n); endif
    [R, F] = rAccu2(n, p);
      Rarr = [Rarr,R];
      Farr = [Farr,F];
  endfor
endfunction

