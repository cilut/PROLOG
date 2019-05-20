%%%%%%%%%%%%%%%%%ALUMNOS DEL GRUPO%%%%%%%%%%%%%%%%%
alumno_prode(xxxxxx,ilut,ciprian,160348).
alumno_prode(martin,mateos,carlos,160185).
alumno_prode(garcia,del_rio,javier,160451).
%%%%%%%%%%%%%%%%%ALUMNOS DEL GRUPO%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%FUNCIONES AUXILIARES%%%%%%%%%%%%%%%%

var(X):-X=f(a).
nonvar(X):-not(var(X)).
not(Goal) :- call(Goal), !, fail.
not(Goal).




addend([],X, [X]). 
addend([C|R],X,  [C|R1]):- 
	addend(R,X,  R1). 
addhead(X, L, [X|L]). 

unaCabeza([Cab|Lista],Cab,Lista).



%%%%%%%%%%%%%%%%FUNCIONES AUXILIARES%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%MENOR%%%%%%%%%%%%%%%%
menor(A,B,Comp,M):-
	functor(X,Comp,2),
	arg(1,X,A),
	arg(2,X,B),
	(call(X),M=A);
	M=B.
%%%%%%%%%%%%%%%%MENOR%%%%%%%%%%%%%%%%	


%%%%%%%%%%%%%%%%MENOR_O_IGUAL%%%%%%%%%%%%%%%%
menor_o_igual(X,Y):-
	(var(X),nonvar(Y) ; var(Y),nonvar(X));		%Uno de los elementos es 0
	functor(X,F1,A1),
	functor(Y,F2,A2),
	((F1@<F2;A1<A2);	%Comprobamos el tamaño de la variable en si
	(F1==F2,menorPrimCadenas(X, Y, 1)));
	X==Y.
	
menorPrimCadenas(X,Y,P):-
		
	arg(P, X, A1),							%obtenemos el argumento indicado	
	(arg(P, Y, A2);not(arg(P, Y, A2))),		%obtenemos el argumento indicado
	
	(
		(
			(var(A1),nonvar(A2), A1 = A2);(var(A2),nonvar(A1), A2 = A1)
		),
		(
			P1=1,P2 is P+P1, menorPrimCadenas(X, Y, P2)
		)

	);		%Uno de los elementos es no variable
	arg(P, X, A1),							%obtenemos el argumento indicado	
	(
		arg(P, Y, A2);not(arg(P, Y, A2))
	),		%obtenemos el argumento indicado
	(
		A1@<A2;
		(
			P1=1,P2 is P+P1, 
			menorPrimCadenas(X, Y, P2)
		)
	);
	(
		arg(P, X, A1),							%obtenemos el argumento indicado	
		(arg(P, Y, A2);not(arg(P, Y, A2))),		%obtenemos el argumento indicado
	 	(A1==A2)
	);
	(
		arg(P, X, A1),							%obtenemos el argumento indicado	
		(arg(P, Y, A2);not(arg(P, Y, A2))),		%obtenemos el argumento indicado
		menor_o_igual(A1,A2)
	).
%%%%%%%%%%%%%%%%MENOR_O_IGUAL%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%LISTA_HOJAS%%%%%%%%%%%%%%%
lista_hojas(Lista,Hojas):-
	lista_hojas_aux(Lista,[],Hojas).

lista_hojas_aux([],Hojas,Hojas).
lista_hojas_aux(Lista,Hojas,Salida):-
	unaCabeza(Lista,Cab,ListaCopia),
	addend(Hojas,tree(Cab,void,void),HojasCopia),
	lista_hojas_aux(ListaCopia,HojasCopia, Salida).
%%%%%%%%%%%%%%%%LISTA_HOJAS%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%HOJAS_ARBOL%%%%%%%%%%%%%%%
hojas_arbol(Hoja,Com,Arbol):-
	(
		%%En caso de que hay un solo elemento en el lista
		unaCabeza(Hoja,Hoja1,HojaCopia),
		ArbolAux=Hoja1
	),
	hojas_arbol_aux(HojaCopia,Com,ArbolAux,Arbol).


hojas_arbol_aux([],Com,Arbol,Arbol).
hojas_arbol_aux(Hoja,Com,ArbolAux,Arbol):-
	(
		
		unaCabeza(Hoja,Hoja1,HojaCopia),
		arg(1,Hoja1,Indice1),
		arg(1,ArbolAux,IndiceArbol),
		menor(Indice1,IndiceArbol, Com, Menor),
		(
			(Menor=IndiceArbol,ArbolAux1=tree(Menor,ArbolAux,Hoja1));
			(Menor=Indice1,ArbolAux1=tree(Menor,Hoja1,ArbolAux))
		)
				
	),
	hojas_arbol_aux(HojaCopia,Com,ArbolAux1,Arbol).
%%%%%%%%%%%%%%%%HOJAS_ARBOL%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%ORDENACION%%%%%%%%%%%%%%%
ordenacion(Arbol, Comp, Orden):-
	arg(1,Arbol,A1),
	arg(2,Arbol,A2),
	
	(%un elemento
		A2==void,
		addend([],A1,Orden)
	);
	(
    	arg(3,Arbol,A3),
    	addhead(A3, [], Hojas),
    	ordenacion_aux(A2,Comp,[],Orden,Hojas)
	).
	

ordenacion_aux(Arbol,Comp, OrdenAux,Orden,Hojas):-
	
	arg(1,Arbol,A1),
	arg(2,Arbol,A2),
	arg(3,Arbol,A3),
	
	(
		A2==void,
		addend(OrdenAux,A1,OrdenAux1),
		reflotar(Hojas,Comp,OrdenAux1,Orden)

	);
	addhead(A3, Hojas, Hojas1),
	ordenacion_aux(A2,Comp,OrdenAux,Orden,Hojas1).
	
	
reflotar([],Comp,Orden,Orden).
reflotar(Hojas,Comp,OrdenAux,Orden):-
	hojas_arbol(Hojas,Comp,Arbol),
	ordenacion_aux(Arbol,Comp,OrdenAux,Orden,[]).
%%%%%%%%%%%%%%%%ORDENACION%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%ORDENAR%%%%%%%%%%%%%%%
ordenar(Lista,Comp,Orden):-
	lista_hojas(Lista,Hojas),
	hojas_arbol(Hojas,Comp,Arbol),
	ordenacion(Arbol,Comp, Orden).
%%%%%%%%%%%%%%%%ORDENAR%%%%%%%%%%%%%%%