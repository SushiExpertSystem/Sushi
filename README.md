# Sushi Expert System 

Thuy Nguyen - 757995
Ciarán O'Brien - 757998

## Description
We were tasked with builidng our own Expert System. After much research and discussions over many other expert systems, we decided on building a sushi suggestion expert system.
We had set this task to ourself and immediately began testing how to build an expert system based on example and tutorials online.

We started with specifying each different catagory of sushi.
As seen below, we defined 5 different varieties of sushi:
```
% classification rules, Q to be asked
maki :- verify(rice_wrapped_in_seaweed).
nigiri :- verify(fish_on_rice).
tamakai :- verify(seaweed_wrappped_in_a_cone).
sashimi :- verify(fish_alone).
uramaki :- verify(seaweed_wrapped_in_rice).
```
We then further defined each sushi by verifying the specific ingredients of each sushi piece
```
vegetable_roll :- uramaki, maki, verify(cucumber), verify(carrots), verify(scallion), verify(asparagus), verify(cream_cheese), verify(rice), verify(seaweed).
shrimp_tempura_roll :- uramaki, maki, verify(shrimp), verify(tempura), verify(avocado), verify(rice), verify(seaweed).
surf_and_turf_roll :- uramaki, verify(crab), verify(cucumber), verify(avocado), verify(rice), verify(seaweed), verify(carrots), verify(tuna), verify(salmon).
```
In order to go through each question, we defined a condition with a variable called Question.
Here we prompt the user to response y. (yes) or n. (no) and iterate through each indentification.
```
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
```

This functions recommends you a drink that will go with your meal. It will first ask if the user would like a drink. The user is then able to enter y. (yes) or n. (no). It will also ask if the user would prefer an alcohol beverage. Again the user is able to respond with a y. or n. If no alcohol is paired with the meal, then the system will recommend the user to order water.
```
goDrinking :- hypothesizeDrink(Drink), % Drink recommendation
	((Drink == beer) -> write(' your paired beer is '),pickBeer() ; undo),
	((Drink == red_wine) -> hypothesizeWine(Wine),write(' your paired red wine is '), write(Wine); undo),
	((Drink == white_wine) -> hypothesizeWine(Wine),write(' your paired white wine is '), write(Wine); undo),
	((Drink == rose) -> hypothesizeWine(Wine),write(' your paired rose wine is '), write(Wine); undo),
	((Drink == sake_wine) -> hypothesizeWine(Wine),write(' your paired sake is '), write(Wine); undo),
	((Drink == water) -> write('Stick with water'); undo).
```

This function randomly picks a beer in the list and returns it. This function will be called when the user enters y. (yes) when asked if they want a drink. 
```
pickBeer() :- random(0, 10, Y),
			  nth0(Y,[koshihikari_echigo, shinshu_sansan, kirin, asahi , asahi_orion, sapporo_fuyumonogatari, beerlao, sapporo, siwo, zhujiang], X),
		      write(X).                      
```


## Picture form of expert system

![Imgur](https://i.imgur.com/oO3OKYb.jpg)


## Sample Interaction of the system

![Imgur](https://i.imgur.com/FViSiBu.jpg)
