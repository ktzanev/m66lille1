//============================================
//
// TP1 : Fonctions
//
// Ce fichier contient deux procédures crées et
// utilisées en L2 de 2013/14.
// Il doit être compléter avec les procédures
// (mais pas les fonctions testes)
// de TP1.
//============================================

//--------------------------------------------
// DiffDiv : calcul les différences divisées
// à partir des points de xdata et les valeurs
// correspondantes de ydata
//--------------------------------------------
function [cfs]=DiffDiv(xdata,ydata)
  n=length(ydata);
  cfs=ydata;
  for j=2:n
    cfs(j:n) = (cfs(j:n)-cfs(j-1:n-1))./(xdata(j:n)-xdata(1:n-j+1));
  end
endfunction

//--------------------------------------------
// HornerNewton : calcul les valeur du polynôme
// d'interpolation en les points [t(1),....,t(n)]=t
// à partir des coefficients calculés avec DiffDiv
// et les points dans xdata
// le résultat est retourné dans y=[y(1),...,y(n)]
//--------------------------------------------
function [y]=HornerNewton(cfs,xdata,t)
  n=length(cfs);
  Id = ones(t);
  y=cfs(n)*Id;
  for i=n-1:-1:1
    y=cfs(i)*Id+y.*(t-xdata(i)*Id);
  end
endfunction



//============================================
// A compléter à partir d'ici avec les
// procédures du TP1.
//============================================


