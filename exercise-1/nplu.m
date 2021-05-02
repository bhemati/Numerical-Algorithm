function [A]  = nplu (A, n)
  validateattributes(A, {'numeric'}, {'size',[n n]},'plu.m')
  validateattributes(n, {'numeric'}, {'scalar', 'nonzero'}, 'plu.m')
  # n = size(A)(1);
  m = zeros(n);

  for k=1:n-1;
    if A(k,k) == 0;
      break;
    endif
    m(k+1:n,k) = A(k+1:n,k)/A(k,k);
    for i = k+1:n
      A(i,k:n) = A(i,k:n) - m(i,k)*A(k,k:n);
    endfor
  endfor
  A = tril(m,-1)+A;
endfunction

# m(:,k) = A(:,k)/A(k,k)
# A(k+1:n,k+1:n) = A(k+1:n,k+1:n) - m(k+1:n,k)*A(k,k+1:n);