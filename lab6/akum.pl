%%%%%%%%%%%%%%%%%%%
% 1. Zdefiniuj predykat max2(L) odnoszący sukces wtw, gdy ustalona lista L
%    reprezentuje zbiór o mocy co najwyżej 2.
% max2(L) :- max2(L, _, _).
%
% max2([], _, _).
% max2([H | T], H, Y) :- max2(T, H, Y).
% max2([H | T], X, H) :- max2(T, X, H).
% % rozwiązanie wyżej ma wielokrotne sukcesy, żeby to sprawdzić:
% % | ?- max2([a, b, a, b]), X = 1.
% % X = 1 ? ;
% % X = 1 ? ;
% % no

% wariant z ćwiczeń
max2([]).
max2([H | T]) :- max2(T, H, _).
max2([], _, _).
max2([H | T], H, Y) :- max2(T, H, Y).
max2([H | T], X, H) :- X \= H, max2(T, X, H).

% wariant mój (niesprawdzony)
% max2([]).
% max2([_]).
% max2([_, _]).
% max2([X, Y, X | T]) :- max2([X, Y | T]).
% max2([X, Y, Y | T]) :- max2([X, Y | T]).

%%%%%%%%%%%%%%%%
% 2. Zdefiniuj predykat
%       rozneZmienne(L) wtw, gdy L jest listą różnych zmiennnych
% zmiennych!! nie stałe, wykorzystujemy occurcheck Prologowy!!

% % gdyby był occur check: (bez occur checka też działa, ale wolniej)
% rz([]).
% rz([X | X]) :- rz(X).

rz([]).
rz([X | L]) :- unify_with_occurs_check(X, L), rz(L).
