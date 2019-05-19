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



length(Xs,N):-
	var(Xs), integer(N), length_num(N,Xs).
length(Xs,N):-
	nonvar(Xs), length_list(Xs,N).
length_num(0,[]).
length_num(N,[_|Xs]):-
	N > 0, N1 is N - 1, length_num(N1,Xs).
length_list([],0).
length_list([X|Xs],N):-
	length_list(Xs,N1), N is N1 + 1.



insert([], Item, [Item]).
insert([H|T], Item, [Item|T]):- H = Item.
insert([H|T], Item, [Item, H|T]):- H @> Item.
insert([H|T], Item, [H|NewT]) :- insert(T, Item, NewT).

addend(X, [], [X]). 
addend(X, [C|R], [C|R1]):- 
	addend(X, R, R1). 

unaCabeza([Cab|Lista],Cab,Lista).
dosCabeza([Cab,Cab1|Lista],Cab, Cab1,Lista).

subterm(Term,Term).
subterm(Sub,Term):-
	functor(Term,F,N),
	subterm(N,Sub,Term).
subterm(N,Sub,Term):-
	arg(N,Term,Arg),% also checks N > 0 (arg/1 fails otherwise!)
	subterm(Sub,Arg).
subterm(N,Sub,Term):-
	N>1,
	N1 is N-1,
	subterm(N1,Sub,Term).

%%%%%%%%%%%%%%%%FUNCIONES AUXILIARES%%%%%%%%%%%%%%%%


menor(A,B,=<,M):-
	(A =< B, M is A ; B =< A, M is B).%,comparadorMenorIgual(Comp).
menor(A,B,<,M):-
	(A < B, M is A ; B < A, M is B).
menor(A,B,>=,M):-
	(A >= B, M is A ; B >= A, M is B).
menor(A,B,>,M):-
	(A > B, M is A ; B > A, M is B).



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



menor_o_igual(X,Y):-
	(var(X),nonvar(Y) ; var(Y),nonvar(X));		%Uno de los elementos es 0
	functor(X,F1,A1),
	functor(Y,F2,A2),
	((F1@<F2;A1<A2);	%Comprobamos el tamaño de la variable en si
	(F1==F2,menorPrimCadenas(X, Y, 1)));
	X==Y.
	%(
	%	functor(X,F1,A1),
	%	functor(Y,F2,A2),
	%	F1
	%).


lista_hojas(Lista,Hojas):-
	lista_hojas_aux(Lista,[],Hojas).

lista_hojas_aux([],Hojas,Hojas).
lista_hojas_aux(Lista,Hojas,Salida):-
	unaCabeza(Lista,Cab,ListaCopia),
	addend(tree(Cab,void,void),Hojas,HojasCopia),
	lista_hojas_aux(ListaCopia,HojasCopia, Salida).





hojas_arbol(Hoja,Com,Arbol):-
	(
		(
			%%En caso de que hay un solo elemento en el lista
			unaCabeza(Hoja,Hoja1,HojaCopia),
			not(unaCabeza(HojaCopia,Hoja2,HojaCopia1)),
			functor(Hoja1,Functor,_),
			arg(1,Hoja1,Indice1),
			ArbolAux=Hoja1
			
		);
		(
			unaCabeza(Hoja,Hoja1,HojaCopia),
			unaCabeza(HojaCopia,Hoja2,HojaCopia1),
			arg(1,Hoja1,Indice1),arg(1,Hoja2,Indice2),
			menor(Indice1,Indice2,Com,Menor),
			(
				(
					Menor==Indice1,
					ArbolAux=tree(Indice1,Hoja1,Hoja2)

				);
				(
					Menor==Indice2,
					ArbolAux=tree(Indice2,Hoja1,Hoja2)
				)
			)
			
		)
	),
	hojas_arbol_aux(HojaCopia1,Com,ArbolAux,Arbol).


hojas_arbol_aux([],Com,Arbol,Arbol).
hojas_arbol_aux(Hoja,Com,ArbolAux,Arbol):-
	(
		(
			%%En caso de que hay un solo elemento en el lista
			unaCabeza(ArbolAux,Hoja1,HojaCopia),
			not(unaCabeza(HojaCopia,Hoja2,HojaCopia1)),
			functor(Hoja1,Functor,_),
			arg(1,Hoja1,Indice1),
			ArbolAux=tree(Indice1,Hoja1,void)
			
		);
		(
			unaCabeza(Hoja,Hoja2,HojaCopia1),
			arg(1,ArbolAux,Indice1),arg(1,Hoja2,Indice2),
			menor(Indice1,Indice2,Com,Menor),
			(
				(
					Menor==Indice1,
					ArbolAux1=tree(Indice1,ArbolAux,Hoja2)

				);
				(
					Menor==Indice2,
					ArbolAux1=tree(Indice2,ArbolAux,Hoja2)
				)
			)
			
		)
	),
	hojas_arbol_aux(HojaCopia1,Com,ArbolAux1,Arbol).


ordenacion(Arbol, Comp, Orden):-
	
	arg(1,Arbol,A1),
	arg(2,Arbol,A2),
	(
		(
		arg(2,A2,A2A2),
		A2A2==void,
		insert([],A1,OrdenAux)
		);
		(
			A2\==void,
			ordenacion_aux(A2,Comp,[],OrdenAux)
		);
		(
			A2==void,
			insert([],A1,Orden)
		)
	),
	(
		(
			A2==void
		);
		(
			arg(3,Arbol,A3),
			arg(1,A3,A3A1),
			insert(OrdenAux,A3A1,Orden)
		)
	).

ordenacion_aux(Arbol,Comp, OrdenAux,Orden):-
	arg(1,Arbol,A1),
	arg(2,Arbol,A2),
	(
		(
			arg(2,A2,A2A2),
			A2A2==void,
			insert([],A1,OrdenAux1)
		);
		ordenacion_aux(A2,Comp,OrdenAux,OrdenAux1)
	),
	arg(3,Arbol,A3),
	arg(1,A3,A3A1),
	insert(OrdenAux1,A3A1,Orden).


%ordenar(Lista,Comp,Orden):-

