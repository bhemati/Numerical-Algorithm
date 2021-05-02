function x = nplinSolve(A,b,n)
  validateattributes(A, {'numeric'}, {'size',[n n]},'nplinSolve.m')
  validateattributes(b, {'numeric'}, {'size',[n 1]},'nplinSolve.m')
  validateattributes(n, {'numeric'}, {'scalar', 'nonzero'}, 'nplinSolve.m')
  C = nplu(A,n);
  y=solveL(C,b,n);
  x=solveU(C,y,n);
endfunction