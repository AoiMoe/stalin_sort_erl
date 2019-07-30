-module(soviet).

-export([
         stalin_sort/1,
         khrushchev_sort/1,
         andropov_sort/1,
         chernenko_sort/1
        ]).

stalin_sort([]) -> [];
stalin_sort([H]) -> [H];
stalin_sort([X, Y | T]) ->
    if X =< Y -> [X | stalin_sort([Y | T])];
       true -> stalin_sort([X | T])
    end.

khrushchev_sort(Xs) ->
    khrushchev_sort_1(Xs, []).

khrushchev_sort_1([], Xs) -> Xs;
khrushchev_sort_1([X | T], []) ->
    khrushchev_sort_1(T, [X]);
khrushchev_sort_1([X | T], [Y | _] = Xs) ->
    if X =< Y -> khrushchev_sort_1(T, [X | Xs]);
       true -> khrushchev_sort_1(T, Xs)
    end.

andropov_sort([]) -> [];
andropov_sort([X]) -> [X];
andropov_sort([X, Y]) when X > Y -> [Y, X];
andropov_sort([_, _] = Xs) -> Xs;
andropov_sort(_) -> error(no_lifetime).

chernenko_sort([]) -> [];
chernenko_sort([X]) -> [X];
chernenko_sort(_) -> error(no_lifetime).
