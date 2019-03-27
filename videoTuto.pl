% Declaramos 
color(r).
color(a).
color(v).
color(am).

igualColor(X,X).

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


%Definimos la lista de construcciones no 100 porcient
construccion([pieza(An, Al, Prof, C)|_]).
dosCabeza([Cab,Cab1|Lista],Cab, Cab1).


%Falta ver como comparamos el color, si son iguales tiene que dar falso
menorIgualPiezaDC(pieza(An0,Al0,Pr0, C0),pieza(An1,Al1,Pr1, C1)) :-
	menorIgualNr(An0,An1),
	menorIgualNr(Al0,Al1),
	menorIgualNr(Pr0,Pr1),
	igualColor(C0,C1).

%Nose si se hace con meto aux
eliminarCabeza([Cabeza|Contruccion],Construccion).

%Elimina al eliminar cabeza, se hace listaCopia porque se vuelve a usar
esTorre([]) :- !, true.
esTorre(Construccion) :-
	construccion(Construccion),
	dosCabeza(Construccion, P1, P2),
	menorIgualPiezaDC(P1, P2),
	eliminarCabeza(Construccion, ConstruccionCopia),
	esTorre(ConstruccionCopia).


esTorrea(Construccion) :-
	construccion(Construccion),
	dosCabeza(Construccion, P1, P2),
	menorIgualPiezaDC(P1, P2).