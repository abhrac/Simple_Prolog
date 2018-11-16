:- [list_utils].

selection_sort_reverse([], []).

selection_sort_reverse(L, OUT):-
	max_pos(L, POS),
	swap(L, 0, POS, PARTIAL),
	[H | T] = PARTIAL,
	selection_sort_reverse(T, T_SORT),
	append([H], T_SORT, OUT).

selection_sort([], []).

selection_sort(L, OUT):-
	min_pos(L, POS),
	swap(L, 0, POS, PARTIAL),
	[H | T] = PARTIAL,
	selection_sort(T, T_SORT),
	append([H], T_SORT, OUT).

