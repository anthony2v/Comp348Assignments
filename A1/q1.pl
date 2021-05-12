individual(anthony, male, jan, susan).
individual(emma, female, jan, susan).
individual(amanda, female, rick, susan).
individual(susan, female, glen, margaret).
individual(steve, male, glen, margaret).
individual(sandra, female, joop, hennie).
individual(michiel, male, joop, hennie).
individual(sven, male, paul, sandra).
individual(alex, male, paul, sandra).
individual(peter, male, michiel, lindy).
individual(sarah, female, michiel, lindy).
individual(jan, male, richter, angela).
individual(joop, male, richter, angela).
individual(terry, female, michiel, lindy).
individual(doug, male, glen, margaret).
offspring(X, Y):-
    individual(X, _, Y, _);
    individual(X, _, _, Y).
niblings(X, Y):-
    siblings(X, Z),
    offspring(Y, Z),
    Y \== X.
siblings(X, Y):-
    individual(X, _, W, V),
    individual(Y, _, W, V),
    Y \== X.
puncle(X, Y):-
    offspring(Y, W),
    individual(W, male, _, _),
    siblings(X, W),
    individual(X, male, _, _).
modridge(X, Y):-
    offspring(Y, W),
    individual(W, female, _, _),
    siblings(X, W),
    individual(X, female, _, _).
avuncle(X, Y):-
    offspring(Y, W),
    individual(W, female, _, _),
    siblings(X, W),
    individual(X, male, _, _).