function x = solveU(B,b,n)
  validateattributes(B, {'numeric'}, {'size',[n n]},'solveU.m')
  validateattributes(b, {'numeric'}, {'size',[n 1]},'solveU.m')
  validateattributes(n, {'numeric'}, {'scalar', 'nonzero'}, 'solveU.m')
  U = triu(B);
  x = ones(n,1);
  for j = n:-1:1
    if U(j,j) ==0
      break;
    endif
      x(j) = b(j)/U(j,j);
      b(1:j-1) = b(1:j-1) - U(1:j-1,j)*x(j);
  endfor
endfunction