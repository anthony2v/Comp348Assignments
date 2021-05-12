?-building(library, lb).

Ground query. Prolog will start its search from the top and will try to unify building(library, lb)
with building(engineering, ev) which will be unsuccessful. It will continue searching and try again
to unify building(library, lb) with building(business, mb) which also be unsuccessful. Finally it
continue searching and try again to unify bulding(library, lb) with building(library, lb) which will
be successful.

? status(finance, A).

Non-ground query. Prolog will search the database from top to bottom and unify the query with the head
of the rule. It will then instatiate X to finance and resolve to the two new queries which are the 
goals of the rule. Both queries must now be evaluated to see if the rule can succeed. The first is
department which will search again from the top and will try to unify department(finance, Y) with
department(electrical, engineering) and then department(civil, engineering) unsuccessfully. It will
then find department(finance, business), try to unify that with department(finance, Y) and find that
Y = business can make the first goal succeed. It will then try to make the second goal succeed, which
is status(business, Z). Prolog will search from the top and try to unify status(business, Z) with 
status(engineering, accredited). It will be unsuccessful and move on. It will then find status(X, Z)
again and then try to do the first goal which will try to unify with all the department rules and 
ultimately be unsuccessful.

? department(civil, Bussiness).

Non-ground query. Prolog will search the database for the first department rule to unify with. 
department(civil, Bussiness) will not unify with department(electrical, engineering) and will then
continue searching. It will then successfully unify with department(civil, engineering) and unify
Bussiness to engineering.

? faculty(X, civil).

Non-ground query. Prolog will search the database and find the same head as the query. It will find
the first 3 and unsuccessfully unify with faculty(smith, electrical), faculty(walsh, electrical),
and faculty(smith, computer). It will then successfully unify with faculty(jones, civil) and unify
X to jones. If specified, Prolog can continue and do the same with faculty(james, civil) and 
faculty(davis, civil).

? faculty(smith, X).

Non-ground query. Prolog will search the database and find the same head as the query. It will find
the first 2 and unsuccessfully unify with faculty(smith, electrical) and faculty(walsh, electrical).
It will successfully unify with faculty(smith, computer).

? department(X, Y).

Non-ground query. Prolog will search the database and find the same head as the query. It will be able
to unify 4 times with the 4 department rules: X = electrical, Y = engineering; X = civil, Y = engineering;
X = finance, Y = business; X = ibm-exams, Y = lb.

? faculty(X, civil), department(civil, Y).

Non-ground query. Prolog will search the database and find the same head as the query. It will find
the first 3 and unsuccessfully unify with faculty(smith, electrical), faculty(walsh, electrical),
and faculty(smith, computer). It will then successfully unify with faculty(jones, civil) and unify
X to jones. It will then go to the next query and search, unify unsuccessfully with department(electrical,
engineering) and then unify successfully with department(civil, engineering) and unify Y to engineering.
If asked to continue, it will go back to faculty rules and repeat the second query for faculty(james, civil)
and then faculty(davis, civil).

? faculty(Smith).

Non-ground query. Prolog with search the database from the top and find the head of faculty(X) to unify with.
It will then fail because Smith is a variable and can't be unified with another variable at this point.

? building(_, X).

Non-ground query. Prolog will search the database from top to bottom and find the first 5 rules to unify with
it will then unify in order: X = ev, X = mb, X = lb, X = h, and X = fg. It will also find building(_, X) to 
unify with but it won't find any more values to unify.

? status(X, accredited), building(X, Y).

Non-ground query. Prolog will search the database from the top to bottom for the status fact and unify with it
when it's found. It will unify X with engineering. The next query will be used to search for building(engineering,
Y) and it will find it at the top of the list. Y will be unified with ev.

? status(_, X), building(X, Y).

Non-ground query. Prolog will search from the top and find the head of the rule status(X, Y). It will then resolve 
the goals of the rule to the other two queries department(X, Z) and status(Z, Y). It will find department(electrical,
engineering) and unify Z with engineering. status(engineering, Y) will be searched for next and status(engineering,
accredited) will be found, so Y will unify to accredited and so will X in the original query. The second part of the
original query will be searched for, that is building(accredited, Y) with which nothing will be found. 

? faculty(X), faculty(X, Y), department(Y, _).

Non-ground query.

? faculty(X), faculty(X, Y), !, department(Y, Z). % note there is a cut (!) here

Non-ground query.

? faculty(X), !, faculty(X, _). % note there is a cut (!) here

Non-ground query.

? department(X, _), \+ faculty(_, X).

Non-ground query.