% Declaramos 
color(r).
color(a).
color(v).
color(am).
colorB(b).

igual(X,X).

nat(0).
nat(s(X)) :- nat(X).

menorIgualNr(0, X) :- nat(X).
menorIgualNr(s(X), s(Y)) :- menorIgualNr(X,Y).

not(X):-X,!,fail.
not(X).

less(0,s(X)) :- nat(X).
less(s(X),s(Y)) :- less(X,Y).

mod(X,Y,X) :- less(X, Y).
mod(X,Y,Z) :- suma(X1,Y,X), mod(X1,Y,Z).

%Estructura de pieza

pieza(Ancho, Alto, Prof, Color) :-
	nat(Ancho),
	nat(Alto),
	nat(Prof),
	color(Color).
unAtributo(pieza(Ancho, Alto, Prof, Color),Ancho, Alto,Prof, Color).

%Definimos la lista de construcciones no 100 porcient

construccion([pieza(An, Al, Prof, C)]).
construccion([pieza(An, Al, Prof, C)|L]) :- construccion(L).

construccionFila([C]):-color(C);colorB(C).
construccionFila([C|L]) :- construccionFila(L).
construccionEdificio([C]):-construccionFila(C).
construccionEdificio([C|L]) :- construccionFila(C),construccionEdificio(L).



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

comparaColor(C1,C2,A,B) :-
	(igual(C1,C2),
	    A=s(0));
	(not(igual(C1,C2)),
            B=s(0)).

comparaConResto(_,[],A):-
	igual(A,s(0)).
comparaConResto(C1, Colores2,A):-
	unaCabeza(Colores2,C2),
	(igual(C1,C2),
	 comparaConResto(C1,[],s(0)));
	unaCabeza(Colores2,C2),
	(not(igual(C1,C2)),
	 eliminarCabeza(Colores2,Colores2Aux),
	 comparaConResto(C1,Colores2Aux,s(s(0)))).
        

contieneColores([],_).
contieneColores(Colores1, Colores2):-
	unaCabeza(Colores1, C1),
	eliminarCabeza(Colores1, Colores1Aux),
	comparaConResto(C1, Colores2,_),
	contieneColores(Colores1Aux,Colores2).

coloresIncluidos(Construccion1,Construccion2) :-
	esTorre(Construccion1),
	esTorre(Construccion2),
	coloresTorre(Construccion1, Colores1),
	coloresTorre(Construccion2, Colores2),
	contieneColores(Colores1,Colores2).


esEdificioPar([]).

esEdificioPar(Construccion) :- 
	construccionEdificio(Construccion),
	unaCabeza(Construccion,Fila),
	NrClavosAux = 0,
	nrClavos(Fila, NrClavosAux,NrClavos),
	mod(NrClavos,s(s(0)),Resto),
	eliminarCabeza(Construccion, ConstruccionAux),
	igual(Resto,0),
	esEdificioPar(ConstruccionAux).


nrClavos([], NrClavosAux,NrClavos):-
	menorIgualNr(s(0),NrClavosAux),
	igual(NrClavosAux,NrClavos).
	
nrClavos(Fila,NrClavosAux,NrClavos):-
	unaCabeza(Fila,C),
	eliminarCabeza(Fila,FilaAux),
	(igual(C,b), nrClavos(FilaAux,NrClavosAux, NrClavos));
	unaCabeza(Fila,C),
	(not(igual(C,b)),
	 suma(s(0),NrClavosAux, NrClavosAux1),
	 eliminarCabeza(Fila,FilaAux),
	 nrClavos(FilaAux,NrClavosAux1,NrClavos)).











%%%%%%%%%%%%%%%%%%%PRUEBAS

%coloresIncluidos([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),a)])

