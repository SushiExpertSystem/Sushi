% Ciaran OBrien
go :- hypothesize(Sushi),
	write('I think you should order '),
	write(Sushi), nl, undo.

% hypothesize to be tested COB
hypothesize(tiger_roll) :- tiger_roll, !.
hypothesize(philadelphia_Roll) :- philadelphia_Roll, !.
hypothesize(crunch_roll) :- crunch_roll, !.
hypothesize(dynamite_roll) :- dynamite_roll, !.
hypothesize(california_roll) :- california_roll, !.
hypothesize(spicy_tuna_roll) :- spicy_tuna_roll, !.
hypothesize(caterpilla_roll) :- caterpilla_roll, !.
hypothesize(spider_roll) :- spider_roll, !.
hypothesize(vegetable_roll) :- vegetable_roll, !.
hypothesize(shrimp_tempura_roll) :- shrimp_tempura_roll, !.
hypothesize(surf_and_turf_roll) :- surf_and_turf_roll, !.
hypothesize(tempura_roll) :- tempura_roll, !.
hypothesize(tamango) :- tamango, !.
hypothesize(maguro) :- maguro, !.
hypothesize(sake) :- sake, !.
hypothesize(ebi) :- ebi, !.
hypothesize(unagi) :- unagi, !.
hypothesize(katsuo) :- katsuo, !.
hypothesize(katsuo) :- katsuo, !.
hypothesize(salmon) :- salmon, !.
hypothesize(unkown). % no diagnosis

% sushi identification rules

% calssification rules, Q to be asked COB
veggie :- verify(meat), !.
fish :- verify(tuna),
	verify(crab),
	verify(eel),
	verify(crab),
	verify(shrimp),
	verify(salmon),
	!.
meat :- !veggie.
% how to ask questions
ask(Question) :- 
        write('Would you eat '), 
        write(Question), 
        write('? '), 
        read(Response), 
        nl, 
         ( (Response == yes ; Response == y) 
         -> assert(yes(Question)) ; 
         assert(no(Question)), fail). 
:- dynamic yes/1,no/1. 
% how to verify 
verify(S) :- (yes(S) -> true ; (no(S) -> fail ; ask(S))). 
% undo all yes/no's 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail. 
undo. 