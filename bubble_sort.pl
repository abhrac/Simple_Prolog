unit_list(L):-
	length(L, LEN),
	LEN =:= 1.

bubble_up(L, OUT):-
	unit_list(L),
	OUT = L.

bubble_up(L, OUT):-
	\+ unit_list(L),
	[E1, E2 | _] = L,
	E1 =< E2,
	[_ | T] = L,
	bubble_up(T, T_SORT),
	OUT = [E1 | T_SORT].

bubble_up(L, OUT):-
	\+ unit_list(L),
	[E1, E2 | T] = L,
	E1 > E2,
	PARTIAL = [E1 | T],
	bubble_up(PARTIAL, PARTIAL_SORT),
	OUT = [E2 | PARTIAL_SORT].

bubble_sort(L, 0, L).

bubble_sort(L, N, OUT):-
	bubble_up(L, PARTIAL),
	ITER is (N - 1),
	bubble_sort(PARTIAL, ITER, OUT).

bubble_sort(L, OUT):-
	length(L, LEN),
	bubble_sort(L, LEN, OUT).

