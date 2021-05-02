function plotter(plotTitle, Rarr, narr)
  figure('Name', plotTitle);
  semilogy(Rarr);
  title(plotTitle);
  nstr = strsplit(int2str(narr));
  xticks(1:length(narr));
  xticklabels(nstr);
  yticks('auto');
  ylabel ('Accuracy');
  xlabel('Size of n');
endfunction