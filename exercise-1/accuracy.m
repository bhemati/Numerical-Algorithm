function z = accuracy(X,Y)
  validateattributes(X, {'numeric'}, {'nonnan'})
  validateattributes(Y, {'numeric'}, {'nonzero'})
  # as semilogy() does not like non-positive inputs I use abs() and replace 0
  # with eps to match the n with the actual accuracy so the plots make sense
  temp = abs(norm(X - Y,1)/norm(Y,1));
  if temp != 0; z = temp; else z = eps; endif
endfunction