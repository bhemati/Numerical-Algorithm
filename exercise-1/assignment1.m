clear all
warning("off");
nmax = 1000;
[Rarr1, Rarr2] = deal([],[]);
narr = [2:10, 15:5:50, 100:50:nmax];
# Part I
t1 = tic;
tt = tic;

# no pivoting
p = 0;
for n = narr
  if n>100; disp('Task 1 calculating for n: '), disp(n); endif
  R = rAccu(n, p);
  Rarr1 = [Rarr1,R];
endfor

# with pivoting
p = 1;
for n = narr
  if n>100; disp('Task 1 calculating for n: '), disp(n); endif
  R = rAccu(n, p);
  Rarr2 = [Rarr2,R];
endfor
plotter('LU Factorization with and without Partial Pivoting', Rarr1, narr);
hold on;
semilogy(Rarr2);
legend('with pivoting', 'without pivoting');
hold off;
elapsed_time_t1 = toc(t1);


# Part II
# Part II.1 and II.2
# Produce non singular L and U
# Forward L 
t2 = tic;
p = 0;
[Rarr, Farr] = dataGenT2(narr, p);
plotter('Forward substitution Part II L matrix ', Rarr, narr)
hold on;
plot(Farr);
legend('residual','forward error');
hold off;
# Back U, calculating only for nmax=200 as after 100 the results jump

# and the plot becomes hard to see
p = 1;
narr2 = [2:10, 15:5:50, 100:50:200];
[Rarr, Farr] = dataGenT2(narr2, p);
plotter('Back substitution Part II U matrix', Rarr, narr2)
hold on;
plot(Farr);
legend('residual','forward error');
hold off;
elapsed_time_t2 = toc(t2);

# Part III

t3 = tic;
[RarrHp, RarrHnp, RarrHo, FarrHp, FarrHnp, FarrHo] = deal([], [], [], [], [], []);
for n = narr
  if n>= 100; disp('Calculating H matrix of size: '), disp(n); endif
  H=zeros(n);
  for i=1:n
    for j=1:n
      H(i,j)=1/(i+j-1);
    endfor
  endfor
  # using the builtin lu function in order to find a suitable b
  # inefficient but doesn't requite much rewriting of the code
  [lh,uh] = lu(H);
  bh = lh*sum(uh,2);
  xho = H\bh;
  xhnp = nplinSolve(H,bh,n);
  xhp = linSolve(H, bh, n);
  r = residual(H, xho, bh);
  RarrHo = [RarrHo, r];
  r = residual(H, xhnp, bh);
  RarrHnp = [RarrHnp, r];
  r = residual(H, xhp, bh);
  RarrHp = [RarrHp, r];
  xx=ones(n,1);
  f = accuracy(xx,xho);
  FarrHo = [FarrHo, f];
  f = accuracy(xx,xhnp);
  FarrHnp = [FarrHnp, f];
  f = accuracy(xx,xhp);
  FarrHp = [FarrHp, f];
endfor
plotter('H-Matrix Relative Residual and Forward Error', RarrHo, narr)
hold on;
semilogy(RarrHnp);
hold on;
semilogy(RarrHp);
legend();
hold on;
plot(FarrHo);
hold on;
plot(FarrHnp);
hold on;
plot(FarrHp);
legend('res octave algorithm', 'res no pivoting', 'res with pivoting',
  'fe octave algorithm', 'fe no pivoting', 'fe with pivoting');
hold off;

[RarrSp, RarrSnp, RarrSo, FarrSp, FarrSnp, FarrSo] = deal([], [], [], [], [], []);
for n = narr
  if n>= 100; disp('Calculating S matrix of size: '), disp(n); endif
  S = -1 + 2*rand(n);
  # using the builtin lu function in order to find a suitable b
  # inefficient but doesn't requite much rewriting of the code
  [ls,us] = lu(S);
  bs = ls*sum(us,2);
  xsnp = nplinSolve(S,bs,n);
  xsp = linSolve(S,bs,n);
  xso = S\bs;
  r = residual(S, xso, bs);
  RarrSo = [RarrSo, r];
  r = residual(S, xsnp, bs);
  RarrSnp = [RarrSnp, r];
  r = residual(S, xsp, bs);
  RarrSp = [RarrSp, r];
  xx=ones(n,1);
  f = accuracy(xx,xso);
  FarrSo = [FarrSo, f];
  f = accuracy(xx,xsnp);
  FarrSnp = [FarrSnp, f];
  f = accuracy(xx,xsp);
  FarrSp = [FarrSp, f];
endfor
plotter('S-Matrix Relative Residual', RarrSo, narr)
hold on;
semilogy(RarrSnp);
hold on;
semilogy(RarrSp);
hold on;
plot(FarrSo)
hold on;
plot(FarrSnp);
hold on;
plot(FarrSp);
legend('res octave algorithm', 'res no pivoting', 'res with pivoting',
  'fe octave algorithm', 'fe no pivoting', 'fe with pivoting');
hold off;
elapsed_time_t3 = toc(t3);
elapsed_time_tt = toc(tt);
disp('Time elapsed Task I: '), disp(elapsed_time_t1);
disp('Time elapsed Task II: '), disp(elapsed_time_t2);
disp('Time elapsed Task III: '), disp(elapsed_time_t3);
disp('Time elapsed Total: '), disp(elapsed_time_tt);