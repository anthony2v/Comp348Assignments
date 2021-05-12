likes(jane, X) = likes(X, josh).

% They won't unify together. X cannot be substituted by jane and josh at the same time.

diSk(27, queens, sgt_pepper) = diSk(A, B, help). 

% They won't unify together. sgt_pepper and help are both atoms so they can't unify together. 

[a,b,c] = [X,Y,Z|T]. 

% They will unify. X = a, Y = b, Z = c, and T = []

ancestor(french(jean), B) = ancestor(A, irish(joe)). 

% They will unify. B = irish(joe), A = french(jean).

characters(hero(luke), X) = characters(X, villain(vader)). 

% They won't unify, X cannot be substituted by hero(luke) and villain(vader) at the same time.

f(X, a(b,c)) = f(d, a(Z, c)). 

% They will unify. X = d, Z = b.

s(x, f(x), z) = s(g(y), f(g(b)), y). 

% They won't unify. All 6 terms are atoms and you can't unify atoms.

vertical( line(point(X,Y), point(X,Z))) = vertical(line(point(1,1),point(1,3))).

% They will unify. X = 1, Y = 1, Z = 3.

g(Z, f(A, 17, B), A+B, 17) = g(C, f(D, D, E), C, E). 

% They will unify. Z = A+B, A = D, D = 17, C = A+B, E = 17.

f(c, a(b,c)) = f(Z, a(Z, c)).

% They won't unify. Z cannot be substituted by b and c at the same time.