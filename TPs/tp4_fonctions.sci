//============================================
//
// TP4 : Fonctions
//
// Ce fichier contient les procédures pour le TP4
//
//============================================



// *********************************
// Méthodes explicites
// *********************************

// Runge-Kutta
// ====================
// - L'équation différentielle à résoudre est de la forme u'=f(u)
// - f est une fonction qui prend un paramètre vecteur colonne
//    et renvoie un vecteur colonne de la même taille
// - On subdivise l'intervalle [0,T] à N sous-intervalles
// - La condition initiale en 0 est le vecteur colonne U0

function [U]=RungeKutta(f,T,N,U0)
  h = T/N;
  U = [U0];
  for n=1:N
    K1 = f(U(:,n));
    K2 = f(U(:,n)+h*K1/2);
    K3 = f(U(:,n)+h*K2/2);
    K4 = f(U(:,n)+h*K3);
    UN = U(:,n)+h*(K1+2*K2+2*K3+K4)/6;
    U=[U UN];
  end
endfunction


// *********************************
// Méthodes implicites
// *********************************

// La méthode de Newton qui est utilisée pour résoudre
// les équations nécessaires aux méthodes implicites
function[val]=Newton(ff,Dff,x0)
  eps = 1D-10;
  val = x0;
  for i = 1:20
    val = val - Dff(val)\ff(val);
    if (norm(val) < eps) then
      break;
    end
  end
endfunction

// Euler implicite
// ====================
// - L'équation différentielle à résoudre est de la forme u'=f(u)
// - f est une fonction qui prend un paramètre vecteur colonne
//    et renvoie un vecteur colonne de la même taille
// - Df est la fonction dérivée de f (ou la jacobienne dans le cas de R^n),
//    nécessaire pour la méthode de Newton
// - On subdivise l'intervalle [0,T] à N sous-intervalles
// - La condition initiale en 0 est le vecteur colonne U0
function [U]=EulerImplicite(f,Df,T,N,U0)
  h = T/N;
  U = [U0];
  deff('y=Dff(x)','y=h*Df(x)-eye(Df(x))');
  for n=1:N
    deff('y=ff(x)','y=U(:,n)+h*f(x)-x');
    UN = Newton(ff,Dff,U(:,n)); // UN est la solution par Newton de X = U(n)+h*f(X);
    U=[U UN];
  end
endfunction

// Crank-Nicolson
// ====================
// les paramètres sont les mêmes que pour Euler implicite
function [U]=CrankNicolson(f,Df,T,N,U0)
  h = T/N;
  U = [U0];
  deff('y=Dff(x)','y=h*Df(x)/2-eye(Df(x))');
  for n=1:N
    deff('y=ff(x)','y=U(:,n)+h*(f(U(:,n))+f(x))/2-x');
    UN = Newton(ff,Dff,U(:,n)); // UN est la solution par Newton de X = U(:,n)+h*(f(U(:,n))+f(X))/2;
    U=[U UN];
  end
endfunction
