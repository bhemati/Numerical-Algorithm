function x = solveL(B,b,n)
  validateattributes(B, {'numeric'}, {'size',[n n]},'solveL.m')
  validateattributes(b, {'numeric'}, {'size',[n 1]},'solveL.m')
  validateattributes(n, {'numeric'}, {'scalar', 'nonzero'}, 'solveL.m')
  L = eye(n) + tril(B,-1);
  x = ones(n,1);
  for j=1:n
    if L(j,j) == 0
      break;
    endif
      x(j) = b(j)/L(j,j);
      b(j+1:n) = b(j+1:n) - L(j+1:n,j)*x(j);
    
  endfor
endfunction
