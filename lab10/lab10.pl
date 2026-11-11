:- discontiguous area/4, perimeter/4.

% ---------------- Task 1: Area and Perimeter ----------------
area(square, Side, A) :- A is Side ** 2.
perimeter(square, Side, P) :- P is 4 * Side.

area(rectangle, W, H, A) :- A is W * H.
perimeter(rectangle, W, H, P) :- P is 2 * (W + H).

area(triangle, Base, Height, A) :- A is 0.5 * Base * Height.
perimeter(triangle, A, B, C, P) :- P is A + B + C.

% ---------------- Task 2: Login ----------------
user(jojo, 1234).
user(sara, abcd).
user(admin, admin123).

login :- attempt(1).

attempt(N) :- N > 3,
    write('Sorry, you exceeded the maximum number of attempts, try again later.'), nl.
attempt(N) :- N =< 3,
    write('Username: '), read(U),
    write('Password: '), read(P),
    (   user(U, P)
    ->  write('Login Successful'), nl
    ;   write('Login Unsuccessful'), nl,
        Left is 3 - N,
        (Left > 0 -> write('Attempts left: '), write(Left), nl ; true),
        N1 is N + 1,
        attempt(N1)
    ).
