% Declaramos 
color(r).
color(a).
color(v).
color(am).


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


%Definimos la lista de construcciones, no 100%

construccion([pieza(An, Al, Prof, C)|Lista]) :-
	construccion(Lista).
%Prueba lista de construcción
construccion([pieza(s(0), s(0), s(0), r), pieza(s(0), s(0), s(0), r)]).

%Falta ver como comparamos el color
menorIgualPieza(pieza(An0,Al0,Pr0, C0),pieza(An1,Al1,Pr1, C1)) :-
	menorIgualNr(An0,An1),
	menorIgualNr(Al0,Al1),
	menorIgualNr(Pr0,Pr1).

%Nose si se hace con meto aux
%eliminarCabeza([Cabeza|Contruccion],Construccion).

%Elimina al eliminar cabeza, se hace listaCopia porque se vuelve a usar
esTorre(Construccion) :-
	menorIgualPieza([P1,P2|Construccion]),
	eliminarCabeza([Cabeza|Construccion], ConstruccionCopia),
	esTorre(ConstruccionCopia).
p1 = pieza(s(0), s(0), s(0), r).
p2 = pieza(s(0), s(0), s(0), r). 