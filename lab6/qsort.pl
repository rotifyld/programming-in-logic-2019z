% 1. Zdefiniuj predykat qsort(L, S) implementujący algorytm QuickSort

% a) wersja bez akumulatora (definicja algorytmu)

% qsort([], []).
% % qsort([X], [X]).
% qsort([X | T], S) :-
%     partition(T, X, L1, L2),
%     qsort(L1, S1),
%     qsort(L2, S2),
%     append(S1, [X | S2], S).

partition([], _, [], []).
partition([X | T], E, [X | L1], L2) :-
    X =< E,
    partition(T, E, L1, L2).
partition([X | T], E, L1, [X | L2]) :-
    X > E,
    partition(T, E, L1, L2).

% b) wersja z akumulatorem.

qsort(L, S) :- qsort(L, [], S).
qsort([], A, A).
qsort([X | T], A, S) :-
    partition(T, X, L1, L2),
    qsort(L1, [X | S2], S),
    qsort(L2, A, S2).
