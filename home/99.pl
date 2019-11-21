% 99 Prolog Problems from http://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/
% Current Progress [5/99] done 1..n omitting {}.


% P01 (*) Find the last element of a list.
% my_last(List, Element) - Element is the last element of List.
last_elem([X], X).
last_elem([_ | T], X) :- last_elem(T, X).
% note: assuming that empty list does not have last element.


% P02 (*) Find the last but one element of a list.
% last_but_one_elem(List, Element)
last_but_one_elem([First, _], First).
last_but_one_elem([_, Second | Tail], X) :- last_but_one_elem([Second | Tail], X).


% P03 (*) Find the K'th element of a list.
% The first element in the list is number 1.
% kth_elem(List, K, Element)
kth_elem([H | _], 1, H).
kth_elem([_ | T], K, X) :- K > 1, K1 is K - 1, kth_elem(T, K1, X).


% P04 (*) Find the number of elements of a list.
% len(List, Length)
len([], 0).
len([_ | T], L) :- L_T is L - 1, len(T, L_T).
% note: if I put L is L_T - 1, 'len(X, 1).' is evaluated infinitely.


% P05 (*) Reverse a list.
% reverse(List, ReverseList)
reverse(L, R) :- reverse(L, [], R).
reverse([], Acc, Acc).
reverse([H | T], Acc, R) :- reverse(T, [H | Acc], R).
