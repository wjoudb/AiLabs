% Lab 9 - The Name Game
% IO stream + database manipulation (assert, asserta, assertz, retract, retractall)
% Run with:  ?- start.
% Answer every prompt with a full stop, e.g.  1.   or   j.

:- dynamic letter/1.

% Starting set of letters
letter(a).
letter(b).
letter(c).

start :-
    nl,
    write('Hi, This is the "Name Game".'), nl,
    write('You will be given a set of English letters in which you will add, delete or move to create your name.'), nl,
    menu.

menu :-
    nl,
    write('Choose from the following:'), nl,
    write('1- Display the current set of letters'), nl,
    write('2- Add a letter'), nl,
    write('3- Add a letter at the top'), nl,
    write('4- Add a letter at the bottom'), nl,
    write('5- Delete a letter'), nl,
    write('6- Delete all letters'), nl,
    write('7- Exit'), nl,
    write('Enter your choice....'), nl,
    read(Choice),
    choice(Choice).

% 7 ends the game, valid choices run then return to the menu
choice(7) :- !, write('Goodbye!'), nl.
choice(C) :- integer(C), C >= 1, C =< 6, !, option(C), menu.
choice(_) :- write('Invalid choice, try again.'), nl, menu.

% 1- Display
option(1) :-
    findall(L, letter(L), Ls),
    write('Current letters: '), write(Ls), nl.

% 2- Add a letter at a given position (also used to move a letter: delete it, then add it here)
option(2) :-
    read_letter(L),
    write('Enter the position (1 = top): '), nl,
    read(P),
    findall(X, letter(X), Ls),
    insert_at(L, P, Ls, New),
    retractall(letter(_)),
    add_all(New),
    write('Letter added.'), nl.

% 3- Add at the top
option(3) :-
    read_letter(L),
    asserta(letter(L)),
    write('Letter added at the top.'), nl.

% 4- Add at the bottom
option(4) :-
    read_letter(L),
    assertz(letter(L)),
    write('Letter added at the bottom.'), nl.

% 5- Delete one letter (first match)
option(5) :-
    read_letter(L),
    (   retract(letter(L))
    ->  write('Letter deleted.')
    ;   write('Letter not found.')
    ),
    nl.

% 6- Delete all
option(6) :-
    retractall(letter(_)),
    write('All letters deleted.'), nl.

% Reads a letter; rejects capitals/variables (Prolog reads J as a variable)
read_letter(L) :-
    write('Enter the letter: '), nl,
    read(X),
    (   atom(X)
    ->  L = X
    ;   write('Please type a lowercase letter, e.g. j.'), nl,
        read_letter(L)
    ).

% insert_at(Letter, Position, OldList, NewList)
insert_at(L, P, Ls, [L|Ls]) :- P =< 1, !.
insert_at(L, _, [], [L]) :- !.
insert_at(L, P, [H|T], [H|R]) :-
    P1 is P - 1,
    insert_at(L, P1, T, R).

add_all([]).
add_all([H|T]) :- assertz(letter(H)), add_all(T).
