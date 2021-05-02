function [r, f] = rAccu2(n, p)
  while true
    B = rand(n);
    if rank(B) == n; break; endif
  endwhile
  xx=ones(n,1);

  if p == 1
    U = triu(B);
    bu = sum(U,2);
    xu = solveU(U,bu,n);

    f=accuracy(xu,xx);
    r=residual(U, xu, bu);
  else
    L = eye(n) + tril(B,-1);
    bl = sum(L,2);
    xl = solveL(L,bl,n);

    f=accuracy(xl,xx);
    r=residual(L, xl, bl);

  endif
endfunction