male(abraham). male(clancy). male(herb). male(homer). male(bart).
female(mona). female(jackie). female(marge). female(patty).
female(selma). female(lisa). female(maggie). female(ling).

parent(abraham, herb).
parent(abraham, homer).  parent(mona, homer).
parent(clancy, marge).   parent(jackie, marge).
parent(clancy, patty).   parent(jackie, patty).
parent(clancy, selma).   parent(jackie, selma).
parent(homer, bart).     parent(marge, bart).
parent(homer, lisa).     parent(marge, lisa).
parent(homer, maggie).   parent(marge, maggie).
parent(selma, ling).

father(X, Y)   :- parent(X, Y), male(X).
mother(X, Y)   :- parent(X, Y), female(X).
son(X, Y)      :- parent(Y, X), male(X).
daughter(X, Y) :- parent(Y, X), female(X).

sibling(X, Y)  :- parent(P, X), parent(P, Y), X \= Y.
brother(X, Y)  :- sibling(X, Y), male(X).
sister(X, Y)   :- sibling(X, Y), female(X).

grandfather(X, Z) :- father(X, Y), parent(Y, Z).
aunt(X, Y)     :- sister(X, P), parent(P, Y).
uncle(X, Y)    :- brother(X, P), parent(P, Y).
cousin(X, Y)   :- parent(P1, X), parent(P2, Y), sibling(P1, P2).

ancestor(X, Z) :- parent(X, Z).                    % base case
ancestor(X, Z) :- parent(X, Y), ancestor(Y, Z).    % recursive case


/* --- Test Queries ---

58 ?- father(X, bart).
X = homer ;
false.

59 ?- father(abraham, X).
X = herb ;
X = homer.

60 ?- mother(X, ling).
X = selma.

61 ?- mother(jackie, X).
X = marge ;
X = patty ;
X = selma.

62 ?- son(X, homer).
X = bart ;
false.

63 ?- son(X, abraham).
X = herb ;
X = homer.

64 ?- daughter(X, marge).
X = lisa ;
X = maggie.

65 ?- daughter(X, clancy).
X = marge ;
X = patty ;
X = selma.

66 ?- brother(X, homer).
X = herb ;
false.

67 ?- brother(X, lisa).
X = bart ;
X = bart ;
false.

69 ?- sister(X, marge).
X = patty ;
X = patty ;
X = selma ;
X = selma ;
false.

69 ?- sister(X, bart).
X = lisa ;
X = lisa ;
X = maggie ;
X = maggie ;
false.

70 ?- grandfather(X, bart).
X = abraham ;
X = clancy ;
false.

71 ?- grandfather(clancy, X).
X = bart ;
X = lisa ;
X = maggie ;
X = ling.

72 ?- aunt(X, bart).
X = patty ;
X = patty ;
X = selma ;
X = selma ;
false.

73 ?- aunt(X, ling).
X = marge ;
X = marge ;
X = patty ;
X = patty ;
false.

74 ?- uncle(X, lisa).
X = herb ;
false.

75 ?- uncle(X, ling).
false.

76 ?- cousin(X, ling).
X = bart ;
X = bart ;
X = lisa ;
X = lisa ;
X = maggie ;
X = maggie ;
false.

77 ?- cousin(X, bart).
X = ling ;
X = ling.

78 ?- ancestor(X, ling).
X = selma ;
X = clancy ;
X = jackie ;
false.

79 ?- ancestor(abraham, X).
X = herb ;
X = homer ;
X = bart ;
X = lisa ;
X = maggie ;
false.

*/
