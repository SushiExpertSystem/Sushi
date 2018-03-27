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
	goDrinking(),
	nl,undo.


goDrinking :- hypothesizeDrink(Drink), % Drink recommendation
	write('So you are having '),
	((Drink == beer) -> pickBeer() ; write(Drink)),
	undo.

%random number random(x, n, z) -
%will pick a number from range x - (n-1)
pickBeer() :- random(0, 10, Y),
	nth0(Y,[koshihikari_echigo, shinshu_sansan, kirin, asahi , asahi_orion, sapporo_fuyumonogatari, beerlao, sapporo, siwo, zhujiang], X),
	write(X).

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

hypothesizeDrink(beer) :- beer,!.
hypothesizeDrink(sake_wine) :- sake_wine,!.
hypothesizeDrink(red_wine) :- red_wine,!.
hypothesizeDrink(white_wine) :- white_wine,!.
hypothesizeDrink(red_wine) :- red_wine,!.
hypothesizeDrink(rose) :- rose,!.
hypothesizeDrink(sake_wine) :- sake_wine,!.
hypothesizeDrink(beer) :- beer,!.
hypothesizeDrink(unkown). % no diagnosis

hypothesizeWine(riesling) :- riesling,!.
hypothesizeWine(chardonnay) :- chardonnay,!.
hypothesizeWine(dry_riesling) :- dry_riesling,!.
hypothesizeWine(dry_champagne) :- dry_champagne,!.
hypothesizeWine(pinot_noir) :- pinot_noir,!.
hypothesizeWine(red_sancerre) :- red_sancerre,!.
hypothesizeWine(dry_rose) :- dry_rose,!.
hypothesizeWine(ginjo) :- ginjo,!.
hypothesizeWine(junmai) :- junmai,!.
hypothesizeWine(unkown).

% sushi identification rules
tiger_roll :- uramaki, verify(avocado), verify(cucumber), verify(tobiko), verify(rice), verify(seaweed).
tamango :- nigiri, verify(egg), verify(seaweed).
maguro :- nigiri, verify(tuna), verify(rice), assert(tuna).
crunch_roll :- uramaki, verify(spice), verify(tuna), verify(tempura), verify(rice), verify(seaweed), assert(tuna).
dynamite_roll :- uramaki, verify(tempura), verify(bean_sprout), verify(carrots), verify(avocado), verify(cucumber), verify(spice), verify(mayo), verify(rice), verify(seaweed).
california_roll :- uramaki, maki, verify(crab), verify(avocado), verify(cucumber), verify(sesame_seeds), verify(rice), verify(seaweed), assert(crab).
spicy_tuna_roll :- uramaki, maki, verify(tuna), verify(mayo), verify(spice), verify(rice), verify(seaweed), assert(tuna).
spider_roll :- uramaki, maki, verify(crab), verify(tempura), verify(cucumber), verify(avocado), verify(spice), verify(mayo), verify(rice), verify(seaweed), assert(crab).
vegetable_roll :- uramaki, maki, verify(cucumber), verify(carrots), verify(scallion), verify(asparagus), verify(cream_cheese), verify(rice), verify(seaweed).
shrimp_tempura_roll :- uramaki, maki, verify(shrimp), verify(tempura), verify(avocado), verify(rice), verify(seaweed), assert(shrimp).
surf_and_turf_roll :- uramaki, verify(crab), verify(cucumber), verify(avocado), verify(rice), verify(seaweed), verify(carrots), verify(tuna), verify(salmon), assert(tuna), assert(salmon), assert(crab).
tempura_roll :- uramaki, verify(tempura), verify(rice), verify(seaweed).
sake :- nigiri, verify(salmon), verify(rice), assert(salmon).
ebi :- nigiri, verify(prawn), verify(rice), assert(prawn).
unagi :- nigiri, verify(eel), verify(rice), verify(seaweed), assert(eel).
katsuo :- sashimi, verify(tuna), assert(tuna).
salmon :- sashimi, verify(salmon), assert(salmon).


% classification rules, Q to be asked
maki :- verify(rice_wrapped_in_seaweed).
nigiri :- verify(fish_on_rice).
tamakai :- verify(seaweed_wrappped_in_a_cone).
sashimi :- verify(fish_alone).
uramaki :- verify(seaweed_wrapped_in_rice).

% wine classification
riesling :- white_wine, tuna.
chardonnay :- white_wine, tuna.
dry_riesling :- white_wine, eel.
dry_champagne :- whtie_wine, tuna, salmon, eel, crab, prawn.
pinot_noir :- red_wine, salmon.
red_sancerre :- red_wine, maki.
dry_rose :- rose, salmon.
ginjo :- sake, tuna, salmon, eel, crab, prawn.
junmai :- sake, tuna, salmon, eel, crab, prawn.

% classification for the paring drinks
white_wine :- drink, verify(white_wine),!.
red_wine :- drink, verify(red_wine),!.
rose :- drink, verify(rose),!.
sake_wine :- drink ,verify(sake),!.	
beer :- drink, verify(beer),!.

drink :- verify(alcohol_with_your_meal),!.

% how to ask questions
ask(Question) :-
        write('Would you like '),
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
