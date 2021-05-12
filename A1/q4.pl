? exists(P), dateofbirth(P, date(_,_,Y)), Y<1963, salary(P, Salary), Salary<15000.

exists will unify with every person but no one will have the criteria of birth year
below 1963 and salary less than 15000 until jack fox is unified with P.

? exists(P), dateofbirth(P,date(_,_,Y)), !, Y<1998, salary(P,Salary), Salary<20000.
exists will unify with the first member of the family, john cohen, and find that he
does have the right criteria and salary. No more members can be found because of the cut.

? wife(person(GivenName, FamilyName, _, works(_,_))).
GivenName and FamilyName name will be unified with the first 2 wives of the first 2 families
but they are unemployed so Prolog will continue its search. The search will succeed with
the unification of GivenName to grace and FamilyName to baily.

? child(X), dateofbirth(X, date(_,_,1983)).
Prolog will search from the top and unify X with the first 2 children but will find that their
dates of birth are not 1983. With X unified to person(louie, baily, date(25, may, 1983), unemployed)
the search will be successful.