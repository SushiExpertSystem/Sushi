% Thuy Nguyen - 757995
% Ciaran OBrien - 757998
go :- hypothesize(Sushi_1), % First Sushi recommendation
	assert(savedSushiValue(Sushi_1)),
	undo,
	go2(Sushi_1).

go2(Saved) :- hypothesize(Sushi_2), % Second Sushi recommendation
	write('I think you should order '),
	write(Saved), 
	write(' and also '),
	write(Sushi_2),
	nl,undo.


% hypothesize to be tested COB
hypothesize(tiger_roll) :- tiger_roll, !.
hypothesize(crunch_roll) :- crunch_roll, !.
hypothesize(dynamite_roll) :- dynamite_roll, !.
hypothesize(california_roll) :- california_roll, !.
hypothesize(spicy_tuna_roll) :- spicy_tuna_roll, !.
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
tiger_roll :- uramaki, verify(avocado), verify(cucumber), verify(tobiko), verify(rice), verify(seaweed).
tamango :- nigiri, verify(egg), verify(seaweed).
maguro :- nigiri, verify(tuna), verify(rice).
crunch_roll :- uramaki, verify(spice), verify(tuna), verify(tempura), verify(rice), verify(seaweed).
dynamite_roll :- uramaki, verify(tempura), verify(bean_sprout), verify(carrots), verify(avocado), verify(cucumber), verify(spice), verify(mayo), verify(rice), verify(seaweed).
california_roll :- uramaki, maki, verify(crab), verify(avocado), verify(cucumber), verify(sesame_seeds), verify(rice), verify(seaweed).
spicy_tuna_roll :- uramaki, maki, verify(tuna), verify(mayo), verify(spice), verify(rice), verify(seaweed).
spider_roll :- uramaki, maki, verify(crab), verify(tempura), verify(cucumber), verify(avocado), verify(spice), verify(mayo), verify(rice), verify(seaweed).
vegetable_roll :- uramaki, maki, verify(cucumber), verify(carrots), verify(scallion), verify(asparagus), verify(cream_cheese), verify(rice), verify(seaweed).
shrimp_tempura_roll :- uramaki, maki, verify(shrimp), verify(tempura), verify(avocado), verify(rice), verify(seaweed).
surf_and_turf_roll :- uramaki, verify(crab), verify(cucumber), verify(avocado), verify(rice), verify(seaweed), verify(carrots), verify(tuna), verify(salmon).
tempura_roll :- uramaki, verify(tempura), verify(rice), verify(seaweed).
sake :- nigiri, verify(salmon), verify(rice).
ebi :- nigiri, verify(prawn), verify(rice).
unagi :- nigiri, verify(eel), verify(rice), verify(seaweed).
katsuo :- sashimi, verify(tuna).
salmon :- sashimi, verify(salmon).

% classification rules, Q to be asked
maki :- verify(rice_wrapped_in_seaweed).
nigiri :- verify(fish_on_rice).
tamakai :- verify(seaweed_wrappped_in_a_cone).
sashimi :- verify(fish_alone).
uramaki :- verify(seaweed_wrapped_in_rice).

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
