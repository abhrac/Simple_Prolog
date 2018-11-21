:- [list_utils].

shift_sublist(L, PREV, POS, END_IDX, OUT):-
	POS > END_IDX,
	OUT = L.

shift_sublist(L, PREV, POS, END_IDX, OUT):-
	CURRENT is POS,
	nth0(CURRENT, L, CURRENT_EL),
	replace(L, POS, PREV, PARTIAL),
	NEXT is (POS + 1),
	shift_sublist(PARTIAL, CURRENT_EL, NEXT, END_IDX, OUT).

shift_sublist(L, START_IDX, END_IDX, OUT):-
	nth0(START_IDX, L, START_EL),
	shift_sublist(L, START_EL, START_IDX, END_IDX, OUT).

insertion_point(L, X, POS, OUT):-
	[H | T] = L,
	H >= X,
	OUT is POS.

insertion_point(L, X, POS, OUT):-
	[H | T] = L,
	H < X,
	NEXT is (POS + 1),
	insertion_point(T, X, NEXT, OUT).

insertion_point(L, X, OUT):-
	insertion_point(L, X, 0, OUT).

partially_sort(L, I_POS, C_POS, OUT):-
	nth0(C_POS, L, C_EL),
	shift_sublist(L, I_POS, C_POS, SHIFTED),
	replace(SHIFTED, I_POS, C_EL, OUT).

insertion_sort(L, POS, OUT):-
	length(L, LEN),
	POS =:= LEN,
	OUT = L.

insertion_sort(L, POS, OUT):-
	nth0(POS, L, X),
	insertion_point(L, X, I_POS),
	partially_sort(L, I_POS, POS, PARTIAL),
	NEXT is (POS + 1),
	insertion_sort(PARTIAL, NEXT, OUT).

insertion_sort(L, OUT):-
	insertion_sort(L, 0, OUT).

