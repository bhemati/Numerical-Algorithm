function r = residual(A, x_hat, b)
  validateattributes(A, {'numeric'}, {'nonnan'},'residual.m');
  validateattributes(x_hat, {'numeric'}, {'nonnan'},'residual.m');
  validateattributes(b, {'numeric'}, {'nonnan'}, 'residual.m');
  # as semilogy() does not like non-positive inputes I use abs() and replace 0
  # with eps to match the n with the actual accuracy so the plots make sense
  temp = abs(norm(A*x_hat - b,1)/norm(A, 1)*norm(x_hat, 1));
  if temp != 0; r = temp; else r=eps; endif
endfunction