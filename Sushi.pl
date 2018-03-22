% Ciaran OBrien
go :- hypothesize(Sushi),
	write('I think you should order '),
	write(Sushi), nl, undo.

% hypothesize to be tested COB
hypothesize(tiger_roll) :- tiger_roll, !.
hypothesize(philadelphia_roll) :- philadelphia_roll, !.
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
tiger_roll :- fish, verify(avocado), verify(cucumber), verify(tobiko), verify(rice), verify(seaweed).
tamango :- veggie, verify(egg), verify(seaweed).
maguro :- fish, verify(tuna), verify(rice).
philadelpha_roll :- fish, verify(salmon), verify(avocado), verify(cream_cheese), verify(rice), verify(seaweed).
crunch_roll :- fish, verify(spice), verify(tuna), verify(tempura), verify(rice), verify(seaweed).
dynamite_roll :- fish, verify(tempura), verify(bean_sprout), verify(carrots), verify(avocado), verify(cucumber), verify(spice), verify(mayo), verify(rice), verify(seaweed).
california_roll :- fish, verify(crab), verify(avocado), verify(cucumber), verify(sesame_seeds), verify(rice), verify(seaweed).
spicy_tuna_roll :- fish, verify(tuna), verify(mayo), verify(spice), verify(rice), verify(seaweed).
caterpillar_roll :- fish, verify(eel), verify(cucumber), verify(avocado), verify(rice), verify(seaweed).
spider_roll :- fish, verify(crab), verify(tempura), verify(cucumber), verify(avocado), verify(spice), verify(mayo), verify(rice), verify(seaweed).
vegetable_roll :- veggie, verify(cucumber), verify(carrots), verify(scallion), verify(asparagus), verify(cream_cheese), verify(rice), verify(seaweed).
shrimp_tempura_roll :- fish, verify(shrimp), verify(tempura), verify(avocado), verify(rice), verify(seaweed).
surf_and_turf_roll :- fish, verify(crab), verify(cucumber), verify(avocado), verify(rice), verify(seaweed), verify(carrots), verify(tuna), verify(salmon).
tempura_roll :- fish, verify(tempura), verify(rice), verify(seaweed).
sake :- fish, verify(salmon), verify(rice).
ebi :- fish, verify(prawn), verify(rice).
unagi :- fish, verify(eel), verify(rice), verify(seaweed).
katsuo :- fish, verify(tuna).
salmon :- fish, verify(salmon).

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
