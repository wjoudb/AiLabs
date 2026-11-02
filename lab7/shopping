% Lab 7 - Shopping Program
% Run with: ?- start.

start :- menu([coffee, milk, chocolate, apple, juice]).

menu(Basket) :-
    write('** SHOPPING LIST **'), nl,
    write('d. display all items.'), nl,
    write('a. Add an item to the list.'), nl,
    write('e. exit.'), nl,
    write('ENTER YOUR CHOICE .'), nl,
    read(Choice),
    choice(Choice, Basket).

choice(d, Basket) :-
    display_items(Basket),
    menu(Basket).
choice(a, Basket) :-
    write('enter the item you want to add it'), nl,
    read(Item),
    write('The item has been added'), nl,
    menu([Item|Basket]).
choice(e, _) :-
    write('Goodbye'), nl.

% Display the list using recursion
display_items([]).
display_items([H|T]) :-
    write(H), nl,
    display_items(T).
