% PRIMERA PARTE: (6 puntos)
% Se pide definir los siguientes predicados para las construcciones tipo torre:

% esTorre/1 (esTorre(Construccion)): predicado que se verifica si Construccion
% cumple las condiciones para ser una torre.

esTorre(Construccion) :-

% alturaTorre/2 (alturaTorre(Construccion,A)): predicado que se verifica si el
% primer argumento (Construccion) es una torre, y el segundo argumento (A) es
% la altura de la torre.

alturaTorre(Construccion,A) :-


% coloresTorre/2 (coloresTorre(Construccion,Colores)): predicado que se
% verifica si el primer argumento (Construccion) es una torre y el segundo
% argumento (Colores) es una lista con los colores de la torre.
% coloresIncluidos/2

coloresTorre(Construccion,Colores) :-

% (coloresIncluidos(Construccion1,Construccion2)):
% predicado que se verifica si (a) ambos predicados son torres y (b) todos los
% colores de la Construccion1 también están en los de la Construccion2.

coloresIncluidos(Construccion1,Construccion2):-

% SEGUNDA PARTE: (4 puntos)
% Se pide definir los siguientes predicados para las construcciones tipo edificio:


% esEdificioPar/1 (esEdificioPar(Construccion)): predicado que es cierto
% Construccion es un edificio que cumple que cada nivel tiene un número par
% clavos.

esEdificioPar(Construccion) :-

% esEdificioPiramide/1 (esEdificioPiramide(Construccion): predicado que
% verifica si Construccion es un edificio que cumple que cada nivel tiene
% ancho estrictamente mayor que el nivel de arriba.

esEdificioPiramide(Construccion) :-