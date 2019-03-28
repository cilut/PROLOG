% Declaramos 
color(r).
color(a).
color(v).
color(am).

igual(X,X).

nat(0).
nat(s(X)) :- nat(X).

menorIgualNr(0, X) :- nat(X).
menorIgualNr(s(X), s(Y)) :- menorIgualNr(X,Y).

%Estructura de pieza

pieza(Ancho, Alto, Prof, Color) :-
	nat(Ancho),
	nat(Alto),
	nat(Prof),
	color(Color).
unAtributo(pieza(Ancho, Alto, Prof, Color),Ancho, Alto,Prof, Color).

%Definimos la lista de construcciones no 100 porcient

construccion([pieza(An, Al, Prof, C)|_]).
dosCabeza([Cab,Cab1|Lista],Cab, Cab1).
unaCabeza([Cab|Lista],Cab).



%Falta ver como comparamos el color, si son iguales tiene que dar falso

menorIgualPiezaDC(pieza(An0,Al0,Pr0, C0),pieza(An1,Al1,Pr1, C1)) :-
	menorIgualNr(An0,An1),
	menorIgualNr(Pr0,Pr1).

%Nose si se hace con meto aux

eliminarCabeza([Cabeza|Construccion],Construccion).

%Elimina al eliminar cabeza, se hace listaCopia porque se vuelve a usar

esTorre([pieza(An, Al, Prof, C)]).
esTorre(Construccion) :-
	construccion(Construccion),
	dosCabeza(Construccion, P1, P2),
	menorIgualPiezaDC(P1, P2),
	eliminarCabeza(Construccion, ConstruccionCopia),
	esTorre(ConstruccionCopia).

suma(0,X,X):- nat(X).
suma(s(X),Y,s(Z)):- suma(X,Y,Z).


contarAltura([],A).

contarAltura(Construccion, A):-
	unaCabeza(Construccion, P),
	unAtributo(P, _,V,_,_),
	suma(V,A,A),
	eliminarCabeza(Construccion, ConstruccionCopia),
	contarAltura(ConstruccionCopia, A).


alturaTorre(Construccion, A) :-
	esTorre(Construccion),
	contarAltura(Construcion, A).



