%%%%%%%%%%%%%%%%FUNCIONES AUXILIARES%%%%%%%%%%%%%%%%
igual(X,X).

nat(0).
nat(s(X)) :- nat(X).

esPar(0).
esPar(s(s(X))):- esPar(X).

menorIgualNr(0, X) :- nat(X).
menorIgualNr(s(X), s(Y)) :- menorIgualNr(X,Y).

not(X):-X,!,fail.
not(X).

menorNr(0,s(X)) :- nat(X).
menorNr(s(X),s(Y)) :- menorNr(X,Y).

suma(0,X,X).
suma(s(X),Y,s(Z)):- suma(X,Y,Z).

unAtributo(pieza(Ancho, Alto, Prof, Color),Ancho, Alto,Prof, Color).

dosCabeza([Cab,Cab1|Lista],Cab, Cab1).
unaCabeza([Cab|Lista],Cab).
meterCabeza(Cab,Lista, [Cab|Lista]).
eliminarCabeza([Cabeza|Construccion],Construccion).

menorIgualPiezaDC(pieza(An0,Al0,Pr0, C0),pieza(An1,Al1,Pr1, C1)) :-
	menorIgualNr(An0,An1),
	menorIgualNr(Pr0,Pr1).


%%%%%%%%%%%%%%%%FUNCIONES AUXILIARES%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%ESTRUCTURAS%%%%%%%%%%%%%%%%
color(r).
color(a).
color(v).
color(am).
colorB(b).

pieza(Ancho, Alto, Prof, Color) :-
	nat(Ancho),
	menorNr(0,Ancho),
	nat(Alto),
	menorNr(0,Alto),
	nat(Prof),
	menorNr(0,Prof),
	color(Color).

construccion([pieza(An, Al, Prof, C)]):-pieza(An,Al,Prof,C).
construccion([pieza(An, Al, Prof, C)|L]) :- pieza(An,Al,Prof,C),construccion(L).

construccionFila([C]):-color(C);colorB(C).
construccionFila([C|L]) :- (color(C);colorB(C)),construccionFila(L).
%%%%%%%%%%%%%%%%ESTRUCTURAS%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%esTorre%%%%%%%%%%%%%%%%

esTorre([pieza(An, Al, Prof, C)]):-pieza(An,AL,Prof,C).
esTorre(Construccion) :-
	construccion(Construccion),
	dosCabeza(Construccion, P1, P2),
	menorIgualPiezaDC(P1, P2),
	eliminarCabeza(Construccion, ConstruccionCopia),
	esTorre(ConstruccionCopia).

%%%%%%%%%%%%%%%%esTorre%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%alturaTorre%%%%%%%%%%%%%%%%
alturaTorre(Construccion, A) :-
	esTorre(Construccion),
	eliminarCabeza(Construccion, ConstruccionCopia),
	unaCabeza(Construccion, P),
	unAtributo(P, _,V,_,_),
	contarAltura(ConstruccionCopia, V, A).

contarAltura([],A,A).
contarAltura(Construccion, B,A):-
	eliminarCabeza(Construccion, ConstruccionCopia),
	unaCabeza(Construccion, C),
	unAtributo(C, _,V,_,_),
	suma(V,B,Aux),
	contarAltura(ConstruccionCopia, Aux, A).
%%%%%%%%%%%%%%%%alturaTorre%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%coloresTorre%%%%%%%%%%%%%%%%
coloresTorre(Construccion, Colores) :-
	esTorre(Construccion),
	unaCabeza(Construccion, P),
	unAtributo(P, _,_,_,C),
	eliminarCabeza(Construccion, ConstruccionCopia),
	meterCabeza(C, [],CAux),
	guardarColores(ConstruccionCopia, CAux, Colores).

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
%%%%%%%%%%%%%%%%coloresTorre%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%coloresIncluidos%%%%%%%%%%%%%%%%

coloresIncluidos(Construccion1,Construccion2) :-
	esTorre(Construccion1),
	esTorre(Construccion2),
	coloresTorre(Construccion1, Colores1),
	coloresTorre(Construccion2, Colores2),
	contieneColores(Colores1,Colores2).

comparaColor(C1,C2,A,B) :-
	(igual(C1,C2),
	    A=s(0));
	    B=s(0).

comparaConResto(_,[],A):-
	igual(A,s(0)).
comparaConResto(C1, Colores2,A):-
	unaCabeza(Colores2,C2),
	(igual(C1,C2),
	 comparaConResto(C1,[],s(0)));
	(unaCabeza(Colores2,C2),
	 eliminarCabeza(Colores2,Colores2Aux),
	 comparaConResto(C1,Colores2Aux,s(s(0)))).

contieneColores([],_).
contieneColores(Colores1, Colores2):-
	unaCabeza(Colores1, C1),
	eliminarCabeza(Colores1, Colores1Aux),
	comparaConResto(C1, Colores2,_),
	contieneColores(Colores1Aux,Colores2).
%%%%%%%%%%%%%%%%coloresIncluidos%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%esEdificioPar%%%%%%%%%%%%%%%%
esEdificioPar([Fila]):-
	construccionFila(Fila),
	NrClavosAux = 0,
	nrClavos(Fila, NrClavosAux,NrClavos),
        esPar(NrClavos),
	eliminarCabeza(Construccion, ConstruccionAux).
esEdificioPar(Construccion) :- 
	unaCabeza(Construccion,Fila),
	construccionFila(Fila),
	NrClavosAux = 0,
	nrClavos(Fila, NrClavosAux,NrClavos),
	esPar(NrClavos),
	eliminarCabeza(Construccion, ConstruccionAux),
	esEdificioPar(ConstruccionAux).

nrClavos([], NrClavosAux,NrClavos):-
	menorIgualNr(s(0),NrClavosAux),
	igual(NrClavosAux,NrClavos).
	
nrClavos(Fila,NrClavosAux,NrClavos):-
	unaCabeza(Fila,C),
	eliminarCabeza(Fila,FilaAux),
	(igual(C,b), nrClavos(FilaAux,NrClavosAux, NrClavos));
	(unaCabeza(Fila,C),
	 suma(s(0),NrClavosAux, NrClavosAux1),
	 eliminarCabeza(Fila,FilaAux),
	 nrClavos(FilaAux,NrClavosAux1,NrClavos)).
%%%%%%%%%%%%%%%%esEdificioPar%%%%%%%%%%%%%%%%




%%%%%%%%%%%%%%%%esEdificioPiramide%%%%%%%%%%%%%%%%
esEdificioPiramide([Fila]):-
	construccionFila(Fila),
	NrClavosAux=0,
	nrClavos(Fila,NrClavosAux,NrClavos).
	
esEdificioPiramide(Construccion):-
	dosCabeza(Construccion,C1,C2),
	NrClavosAux=0,
	nrClavos(C1,NrClavosAux,NrClavos1),
	nrClavos(C2,NrClavosAux,NrClavos2),
	menorNr(NrClavos1,NrClavos2),
	eliminarCabeza(Construccion,ConstruccionAux),
	esEdificioPiramide(ConstruccionAux).


