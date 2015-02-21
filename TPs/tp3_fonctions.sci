//============================================
//
// TP3 : Fonctions
//
// Ce fichier contient une procédure pour le TP3
//
//============================================

// affichage d'une matrice sous forme de photo 
// en niveaux de gris
function plotimage(photo)
  // grayplot avec 256 niveaux de gris
  xset("colormap",graycolormap(256));
  // taille de l'image
  [m n] = size(photo);
  // affichage de l'image
  grayplot(1:m,1:n,photo);
endfunction
