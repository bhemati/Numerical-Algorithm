function z = rAccu(n, p)
  A = rand(n);
  if p == 1
    [a,p] = plu(A, n);
    L = eye(n) + tril(a,-1);
    U = zeros(n) + triu(a);
    # pm turns p into a n*n matrix
    pm=eye(n)(p,:);
    z=accuracy((pm'*L*U),A);
  else
    a2 = nplu(A,n);
    L = eye(n) + tril(a2,-1);
    U = zeros(n) + triu(a2);
    tmp2 = L*U;
    z = accuracy(tmp2,A);
  endif
endfunction
