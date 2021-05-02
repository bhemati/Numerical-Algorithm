function x = linSolve(A,b,n)
  validateattributes(A, {'numeric'}, {'size',[n n]},'linSolve.m')
  validateattributes(b, {'numeric'}, {'size',[n 1]},'linSolve.m')
  validateattributes(n, {'numeric'}, {'scalar', 'nonzero'}, 'linSolve.m')
  [C,p] = plu(A, n);
  y=solveL(C,b(p),n);
  x=solveU(C,y,n);
endfunction