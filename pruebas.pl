COPIAD ESTA FUNCION EN EL CODIGO PARA PODER TESTEAR
not(Var):-Var,!,fail.
not(Var).



%%%%% PRIMERA PARTE %%%%%

pieza(Ancho, Alto, Prof, Color) :-

ESTORRE
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)]),
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(s(0))),s(0),a)]),
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)]),
esTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(s(0)),s(s(0)),s(s(0)),v),pieza(s(s(s(0))),s(s(s(0))),s(s(s(0))),am)]),
not(esTorre([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),a)])),
not(esTorre([pieza(s(0),s(0),s(s(0)),r),pieza(s(0),s(0),s(0),a)])),
not(esTorre([pieza(s(s(0)),s(s(0)),s(s(0)),r),pieza(s(0),s(0),s(0),a)])),
not(esTorre([s(s(s(s(0)))),pieza(s(0),s(0),r),pieza(s(0),s(0),s(0),a)])).

ALTURATORRE
Pruebas que tiene que dar correcto: 
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(0))),
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)],s(s(s(0)))),
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(s(0)),s(s(0)),s(s(0)),v),pieza(s(s(s(0))),s(s(s(0))),s(s(s(0))),am)],s(s(s(s(0))))), FALLO
alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(s(s(s(0)))))), FALLO
not(alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(0))),
not(alturaTorre([pieza(s(0),s(0),s(0),r),pieza(s(0),s(s(0)),s(0),r),pieza(s(0),s(s(s(0))),s(0),r)],s(s(0)))),
not(alturaTorre([pieza(s(s(0)),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],s(s(0)))).

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
not(coloresTorre([pieza(s(0),s(0),s(0),v),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),r),pieza(s(0),s(0),s(0),a)],[v,r,r,a])).

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
esEdificioPar([[b,b,r,r,b,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,am,a,a,a],[b,b,am,am,b,b]]),
esEdificioPar([[b,r,r,r,r,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,am,a,a,a],[b,b,am,am,b,b]]),
not(esEdificioPar([[b,b,b,r,b,b],[b,v,v,v,b,b],[b,v,v,v,b,b],[a,a,a,am,a,a,a],[b,b,am,am,b,b]])),
not(esEdificioPar([[b,r,r,r,r,b],[b,v,v,v,v,b],[b,b,v,v,b,b],[a,a,a,am,a,a,a],[b,b,am,b,b,b]])).


ESEDIFICIOPIRAMIDE
esEdificioPiramide([b,b,r,b,b],[b,r,a,am,b],[r,r,r,r,r]),
esEdificioPiramide([b,b,b,v,b,b,b],[b,b,r,v,r,b,b],[b,r,a,am,v,a,b],[r,r,r,r,r,r,r]),
esEdificioPiramide([b,b,b,b,v,b,b,b,b],[b,b,b,r,v,r,b,b,b],[b,b,r,a,am,v,a,b,b],[b,r,r,r,r,r,r,r,b],[am,r,r,r,r,r,r,r,am]),
esEdificioPiramide([v,b,b,b,b,b,b,b,b],[r,v,b,b,b,b,b,b,b],[am,a,r,a,am,b,b,b,b],[a,r,r,r,r,r,r,r,b],[am,r,r,r,r,r,r,r,am]),
esEdificioPiramide([b,b,b,b,b,b,b,b,r],[b,b,b,b,b,a,a,a,a],[b,b,b,b,am,v,a,am,am],[b,b,r,r,r,r,r,r,a],[am,r,r,r,r,r,r,r,a]),