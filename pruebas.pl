COPIAD ESTA FUNCION EN EL CODIGO PARA PODER TESTEAR
not(Var):-Var,!,fail.
not(Var).



%%%%% PRIMERA PARTE %%%%%

pieza(Ancho, Alto, Prof, Color) :-

ESTORRE
esTorre([pieza(s(0),s(0),s(0),r)]),
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)]),
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(s(0))),s(0),a)]),
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)]),
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(s(0)),s(s(0)),s(s(0)),v),pieza(s(s(s(0))),s(s(s(0))),s(s(s(0))),am)]),
not(esTorre([cosa(s(0),s(0),s(0),r)])),
not(esTorre([pieza(s(0),s(0),s(0),s(0),r)])),
not(esTorre([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),a)])),
not(esTorre([pieza(s(0),s(0),s(0),r),cosa(s(0),s(0),s(0),a)])),
not(esTorre([cosa(s(0),s(0),s(0),r),cosa(s(0),s(0),s(0),a)])),
not(esTorre([cosa(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)])),
not(esTorre([pieza(s(0),s(0),s(s(0)),r),pieza(s(0),s(0),s(0),a)])),
not(esTorre([pieza(s(s(0)),s(s(0)),s(s(0)),r),pieza(s(0),s(0),s(0),a)])),
not(esTorre([pieza(s(0),s(0),s(0),r),cosa(s(0),s(0),s(0),a)])),
not(esTorre([s(s(s(s(0)))),pieza(s(0),s(0),r),pieza(s(0),s(0),s(0),a)])).

ALTURATORRE
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(0))),
alturaTorre([pieza(s(0),s(s(s(0))),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)],s(s(s(s(s(s(0))))))),
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(0))),
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)],s(s(s(s(s(s(0))))))),
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(s(s(s(0))))),s(0),r),pieza(s(0),s(s(s(s(s(s(0)))))),s(0),r)],s(s(s(s(s(s(s(s(s(s(s(s(0))))))))))))),
not(alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(0))),
not(alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)],s(s(0)))),
not(alturaTorre([pieza(s(0),s(0),s(0),r),cosa(s(0),s(0),s(0),a)],s(s(s(0))))),
not(alturaTorre([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(s(0))))).

COLORESTORRE 
coloresTorre([pieza(s(0),s(0),s(0),a)],[a]),
coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,a]),
coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,r,a]),
coloresTorre([pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),a)],[am,am,am,a]),
coloresTorre([pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[v,r,r,r,a]),
not(coloresTorre([pieza(s(0),s(0),s(0),a)],[])),
not(coloresTorre([pieza(s(0),s(0),s(0),color)],[v])),
not(coloresTorre([pieza(s(0),s(0),s(0),a)],[color])),
not(coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,r])),
not(coloresTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[r,r,v])),
not(coloresTorre([pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),a)],[a,am,am,a])),
not(coloresTorre([pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[v,r,r,a])),
not(coloresTorre([pieza(s(0),s(0),s(0),r),cosa(s(0),s(0),s(0),a)],[r,a]).

COLORESINCLUIDOS
coloresIncluidos([pieza(s(0),s(0),s(0),r)],[pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]),
coloresIncluidos([pieza(s(0),s(0),s(0),r),pieza(s(s(0)),s(0),s(0),a)],[pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),r)]),
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),a)],[pieza(s(s(0)),s(0),s(s(0)),a)]),
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),am)]),
coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),am),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]),
coloresIncluidos([pieza(s(s(0)),s(0),s(0),r)],[pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)]),
not(coloresIncluidos([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),r)],[pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)])),
not(coloresIncluidos([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r)],[pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)])), 
not(coloresIncluidos([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),r)],[pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)])),
not(coloresIncluidos([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r)],[pieza(s(0),s(0),s(0),v)])),
not(coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),a)])),
not(coloresIncluidos([pieza(s(0),s(0),s(0),a),pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),am)],[pieza(s(0),s(0),s(0),r)])).


%%%%% SEGUNDA PARTE %%%%%

ESEDIFICIOPAR
esEdificioPar([[b,b,r,r,b,b]]),
esEdificioPar([[b,b,r,r,b,b],[b,v,v,v,v,b],[b,b,v,v,b,b]]),
esEdificioPar([[b,b,r,r,r,r,b,b],[b,v,v,r,r,v,v,b],[b,b,v,v,r,r,b,b]]),
esEdificioPar([[b,b,r,a,a,a,a,r,b,b],[b,v,v,v,v,v,v,v,v,b],[b,b,v,r,r,r,r,v,b,b]]),
esEdificioPar([[r,r],[r,r],[v,v]]),
esEdificioPar([[b,b,r,r,b,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,am,a,a,a],[b,b,am,am,b,b]]),
esEdificioPar([[b,r,r,r,r,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,am,a,a,a],[b,b,am,am,b,b]]),
not(esEdificioPar([[b,b,b,r,b,b],[b,v,v,v,b,b],[b,v,v,v,b,b],[a,a,a,am,a,a,a],[b,b,am,am,b,b]])),
not(esEdificioPar([[b,r,r,r,r,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,a,am,a,a,a],[b,b,am,b,b,b]])),
not(esEdificioPar([[b,b,r,r,b,b],[]])),
not(esEdificioPar([[],[b,b,r,r,b,b]])),
not(esEdificioPar([[],[]])),
not(esEdificioPar([[b,b,r,r,b,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,p,p,a,a],[b,b,am,am,b,b]])),
not(esEdificioPar([[cosa],[b,b,r,r,b,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,a,a,a,a],[b,b,am,am,b,b]])).


ESEDIFICIOPIRAMIDE
esEdificioPiramide([[b,b,r,b,b],[b,r,a,am,b],[r,r,r,r,r]]),
esEdificioPiramide([[b,b,r,r,b,b],[b,r,a,a,am,b],[r,r,r,r,r,r]]),
esEdificioPiramide([[b,b,b,v,b,b,b],[b,b,r,v,r,b,b],[b,r,a,am,v,a,b],[r,r,r,r,r,r,r]]),
esEdificioPiramide([[b,b,b,b,v,b,b,b,b],[b,b,b,r,v,r,b,b,b],[b,b,r,a,am,v,a,b,b],[b,r,r,r,r,r,r,r,b],[am,r,r,r,r,r,r,r,am]]),
esEdificioPiramide([[v,b,b,b,b,b,b,b,b],[r,v,b,b,b,b,b,b,b],[am,a,r,a,am,b,b,b,b],[a,r,r,r,r,r,r,r,b],[am,r,r,r,r,r,r,r,am]]),
esEdificioPiramide([[b,b,b,b,b,b,b,b,r],[b,b,b,b,b,a,a,a,a],[b,b,b,b,am,v,a,am,am],[b,b,r,r,r,r,r,r,a],[am,r,r,r,r,r,r,r,a]]),
not(esEdificioPiramide([[r,r,b,r,r],[a,b,b,am,v],[r,b,b,b,b]])),
not(esEdificioPiramide([[r,r,b,b,r,r],[a,b,b,b,am,v],[r,b,b,b,b,b]])),
not(esEdificioPiramide([[r,r,p,p,r,r],[a,b,b,b,am,v],[r,b,b,b,b,b]])),
not(esEdificioPiramide([[],[a,b,b,b,am,v],[r,b,b,b,b,b]])),
not(esEdificioPiramide([[b,b,b,b,v,b,b,b,b],[b,b,b,r,v,r,b,b,b],[b,b,r,a,am,v,a,b,b],[b,r,r,r,r,r,r,r,b],[]])).