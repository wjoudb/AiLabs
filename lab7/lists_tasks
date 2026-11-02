% Lab 7 - Task 1
% deleteElement(X, List, Result): remove every X from List
deleteElement(_, [], []).
deleteElement(X, [X|T], R) :-
    deleteElement(X, T, R).
deleteElement(X, [H|T], [H|R]) :-
    X \= H,
    deleteElement(X, T, R).

% Lab 7 - Task 2
% add_at_the_end(X, List, Result): put X at the end of List
conc([], L, L).
conc([X|L1], L2, [X|L3]) :- conc(L1, L2, L3).

add_at_the_end(X, L, R) :-
    conc(L, [X], R).
