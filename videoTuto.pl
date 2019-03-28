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

meterCabeza(Cab,Lista, [Cab|Lista]).



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

suma(0,X,X). %modificado
suma(s(X),Y,s(Z)):- suma(X,Y,Z).


contarAltura([],A,A).
contarAltura(Construccion, A, B):-
	unaCabeza(Construccion, P),
	unAtributo(P, _,V,_,_),
	suma(V,A,B),
	eliminarCabeza(Construccion, ConstruccionCopia),
	contarAltura(ConstruccionCopia, B, C).


alturaTorre(Construccion, A) :-
	esTorre(Construccion),
	unaCabeza(Construccion, P),
	unAtributo(P, _,V,_,_),
	eliminarCabeza(Construccion, ConstruccionCopia),
	contarAltura(ConstruccionCopia, V, A).


invertirColores([], Colores, Colores).
invertirColores(CAux, CAux1, Colores):-
	unaCabeza(CAux, P),
	eliminarCabeza(CAux, CAux3),
	meterCabeza(P, CAux1, CAux2),
	invertirColores(CAux3, CAux2, Colores).


guardarColores([], CAux, Colores):-
	invertirColores(CAux, [], Colores).	
guardarColores(Construccion, CAux, Colores):-
	unaCabeza(Construccion, P),
	unAtributo(P, _,_,_,C),
	eliminarCabeza(Construccion, ConstruccionCopia),
	meterCabeza(C, CAux, CAux1),
	guardarColores(ConstruccionCopia, CAux1, Colores).


coloresTorre(Construccion, Colores) :-
	esTorre(Construccion),
	unaCabeza(Construccion, P),
	unAtributo(P, _,_,_,C),
	eliminarCabeza(Construccion, ConstruccionCopia),
	meterCabeza(C, [],CAux),
	guardarColores(ConstruccionCopia, CAux, Colores).


