elimina(corleone, solozzo) :-
	controla(corleone, manhattan),
	controla(corleone, brooklyn).
elimina(solozzo, corleone):-
	controla(solozzo, droga),
	apoya(roth,solozzo).
controla(solozzo,bronx) :-
	apoya(roth, solozzo).
controla(solozzo, harlem) :-
	apoya(roth, solozzo).
controla(corleone, manhattan) :-
	apoya(roth, corleone).
controla(corleone, brooklyn) :-
	apoya(roth, corleone).
controla(solozzo, droga).
controla(corleone, policia) :-
	controla(corleone, juego).
apoya(roth, P) :-
	garantiza(P, roth).
garantiza(X, Y) :-
	controla(X, policia).

