function [A,p]  = plu (A, n)
  validateattributes(A, {'numeric'}, {'size',[n n]},'plu.m')
  validateattributes(n, {'numeric'}, {'scalar', 'nonzero'}, 'plu.m')
  # n = size(A)(1);
  m = zeros(n);
  p = 1:n;
  for k=1:n-1;
    mx=max(abs(A(k:n,k)));
    for i=k:n
      if abs(A(i,k)) >= mx
        A([k i],:) = A([i k],:);
        p([k i]) = p([i k]);
        m([k i],:) = m([i k],:);
      endif
    endfor
    if A(k,k) == 0;
      continue;
    endif
    for i=k+1:n
      m(i,k) = A(i,k)/A(k,k);
    endfor
    for i = k+1:n
      A(i,k:n) = A(i,k:n) - m(i,k)*A(k,k:n);
    endfor
  endfor
  A = tril(m,-1)+A;
endfunction