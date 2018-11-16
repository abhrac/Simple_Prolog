duplicate([], []).

duplicate(LIST, OUT):-
	[H|T] = LIST,
	duplicate(T, D_T),
	D_H = [H|[H]],
	append(D_H, D_T, OUT).

current_max(L, MAX_POS, C_POS):-
	nth0(MAX_POS, L, C_MAX),
	nth0(C_POS, L, C_EL),
	C_EL > C_MAX.

current_min(L, MIN_POS, C_POS):-
	nth0(MIN_POS, L, C_MIN),
	nth0(C_POS, L, C_EL),
	C_EL < C_MIN.

max_pos(L, MAX_POS, C_POS, OUT):-
	length(L, LEN),
	C_POS =:= LEN,
	OUT is MAX_POS.

max_pos(L, MAX_POS, C_POS, OUT):-
	current_max(L, MAX_POS, C_POS),
	N_POS is (C_POS + 1),
	max_pos(L, C_POS, N_POS, OUT).

max_pos(L, MAX_POS, C_POS, OUT):-
	\+ current_max(L, MAX_POS, C_POS),
	N_POS is (C_POS + 1),
	max_pos(L, MAX_POS, N_POS, OUT).

max_pos(L, OUT):-
	max_pos(L, 0, 0, OUT).

min_pos(L, MIN_POS, C_POS, OUT):-
	length(L, LEN),
	C_POS =:= LEN,
	OUT is MIN_POS.

min_pos(L, MIN_POS, C_POS, OUT):-
	\+ current_min(L, MIN_POS, C_POS),
	N_POS is (C_POS + 1),
	min_pos(L, MIN_POS, N_POS, OUT).

min_pos(L, MIN_POS, C_POS, OUT):-
	current_min(L, MIN_POS, C_POS),
	N_POS is (C_POS + 1),
	min_pos(L, C_POS, N_POS, OUT).

min_pos(L, OUT):-
	min_pos(L, 0, 0, OUT).

replace(L, CURRENT, IDX, X, OUT):-
	[H | T] = L,
	CURRENT =:= IDX,
	OUT = [X | T].

replace(L, CURRENT, IDX, X, OUT):-
	CURRENT \= IDX,
	NEXT = CURRENT + 1,
	[H | T] = L,
	replace(T, NEXT, IDX, X, PARTIAL),
	OUT = [H | PARTIAL].

replace(L, IDX, X, OUT):-
	replace(L, 0, IDX, X, OUT).

swap(L, I1, I2, OUT):-
	nth0(I1, L, EL_1),
	nth0(I2, L, EL_2),
	replace(L, I1, EL_2, OUT_1),
	replace(OUT_1, I2, EL_1, OUT).

