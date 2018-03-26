# Sushi Expert System 

Thuy Nguyen - 757995
Ciarán O'Brien - 757998

## Description
We were tasked with builidng our own Expert System. Aft er much research and discussions over many other expert systems, we decided on building a sushi suggestion expert system.
We had set this task to ouself and imidiately began testing how to build an expert system based on example and tutorials online.

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
We then further defined each sushi by verifying the specific ingrediants of each sushi piece
```
vegetable_roll :- uramaki, maki, verify(cucumber), verify(carrots), verify(scallion), verify(asparagus), verify(cream_cheese), verify(rice), verify(seaweed).
shrimp_tempura_roll :- uramaki, maki, verify(shrimp), verify(tempura), verify(avocado), verify(rice), verify(seaweed).
surf_and_turf_roll :- uramaki, verify(crab), verify(cucumber), verify(avocado), verify(rice), verify(seaweed), verify(carrots), verify(tuna), verify(salmon).
```
In order to go thorugh each question, we defined a condition with a variable called Question.
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
