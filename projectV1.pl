:-dynamic person/4.
% person(name,age,hight,weight)

% breakfast(number, List of meal)
breakfast(1,['2 hard boiled eggs','1 cup berries','1 piece whole grain toast']).
breakfast(2,['whole grain english muffin topped with 1 tbsp peanut butter','1 cup grapes']).
breakfast(3,['blend: 1 cup berries, 1 banana, 1/2 cup oats, 1/2 cup peanut butter, 1 cup almond milk and ice.']).
breakfast(4,['1 piece whole grain toast','mashed avocados','fresh sliced peach']).

% lunch(number, List of meal)
lunch(1,['chicken quinoa soup', '1 cup of green salad.']).
lunch(2,['egg salad sandwich', '1 cup of orange juice.']).
lunch(3,['lettuce wraps with chicken', 'tomatoes','avocados']).
lunch(4,['whole grain tortilla', 'cheese','your favorite veggies']).
lunch(5,['turkey', 'whole wheat pita','spinach leaves and cucumbers']).

% dinner(number, List of meal)
dinner(1,['chicken and veggie soup', '1 cup of green salad.']).
dinner(2,['omlettes', 'whole grain toast']).
dinner(3,['roasted chicken', 'asparagus','cheesy quinoa']).
dinner(4,['salamon', 'roasted potatoes','carrots and corn']).
dinner(5,['sweet potato fries', 'salad','grilled chicken']).

% gym(city name,, gym name, tel)
gym(jubail,'First Fitness Maker','Tel: +966-13-8882304').
gym(jubail,'Nojoom GYM','Tel: +966-13-8982803').
gym(jubail,'Stars Gym and Fitness centre','Tel: +966-13-8943134').
gym(jubail,'Al Jawareh Gym','Tel: +966-13-8945090').
gym(jubail,'Kentz camp','Tel: +966-13-8954121').
gym(jubail,'Al Taloof Gym','Tel: +966-13-8945001').
gym(khobar,'NuYu Fitness Khobar','Tel: +966-13-9845765').
gym(khobar,'Al Khobar Gym','Tel: +966-13-8934112').
gym(khobar,'THE POWER GYM','Tel: +966-13-8834119').
gym(khobar,'Milos gym','Tel: +966-13-9861090').
gym(khobar,'Fitness Time Ladies','Tel: +966-13-9034762').
gym(khobar,'Sparkle fitness','Tel: +966-13-8942098').
gym(dammam,'NuYu Fitness','Tel: +966-13-8934007').
gym(dammam,'NuYu Fitness Dammam','Tel: +966-13-8347009').
gym(dammam,'Blue Shark Gym','Tel: +966-13-8923001').
gym(dammam,'Power Gym','Tel: +966-13-8934211').
gym(dammam,'Fitness Time Ladies','Tel: +966-13-8932176').
gym(dammam,'The Gold Gym','Tel: +966-13-8943128').
gym('al dhahran','al dhahran','Tel: +966-13-8976754').
gym('al dhahran','Schwinn Spinning Center','Tel: +966-13-8932145').
gym('al dhahran','Miller ladies GYM','Tel: +966-13-8956787').
gym('al dhahran','North Park Male Fitness Center','Tel: +966-13-8932154').
gym('al dhahran','Sport complex','Tel: +966-13-8956876').
gym('al dhahran','Yoga and Meditation Center','Tel: +966-13-8974211').
gym('al ahsa','Fitness Time Pro','Tel: +966-13-8970907').
gym('al ahsa','Body Masters','Tel: +966-13-8931267').
gym('al ahsa','Power Master','Tel: +966-13-8923456').
gym('al ahsa','Max Fitness','Tel: +966-13-8922189').


fitbot:- 
writeln('welcome to FitBit, for happy healthy lifestyle.'),
writeln('Wondering what FitBot will offer for you? '),
writeln('FitBot designed to help you to assist a healthy lifestyle and maintain it. FitBot offer many great services like: '),
writeln(' - Diets plan. '),
writeln(' - Many workouts plan. '),
writeln(' - Find gyms based on where you live. '), 
personInformation.

menu:-
nl,write(" *** FitBot services *** "),nl,
write("  1-   Diets Plan."),nl,
write("  2-   Workouts Plan."),nl,
write("  3-   Find Gyms."),nl,
write("  4-   Exit."),nl,
write(" Enter Your Choice:"),nl,
read(X),
choice(X).

choice(1):- calculateBMI.
choice(2):- writeln('do you want to loss weight or to gain weight [loss/gain]? '),read(W),workoutPlan(W),nl,nl,menu.
choice(3):- writeln('where do you live ? '),read(X),printGyms(X),menu.
choice(4):- writeln('Thank you for using FitBot.'), abort.

personInformation:-
nl,write('Now, tell me about yourself So I can create the most effective program for you.'), nl, 
write('Name: '), read(Name),nl,
write('Age: '), read(Age),nl ,
write('Height IN m: '),read( Height ),nl,
write('Weight IN kg: '),read(Weight), 
assertz(person(Name,Age,Height,Weight)), 
write('Thank you, I will try my best to help you.'), menu.

 calculateBMI:- 
 person(_,_,X,Y), BMI is Y/(X**2),nl, write('BMI = '), write(BMI),
 18.5<BMI,BMI<25 -> nl,write(', it is in the normal range.'),write(' Keep doing your best.'), menu;
 nl,write(', it is above the normal range.'),
 writeln('we have a great diet plan for you, Do you want to discover fitBot diet Plan [yes/no] ? '),read(Diet),dietPlan(Diet).
 
 dietPlan(no):- 
writeln(' Stay healthy. you will be redirected to the main menu. '),nl,menu.

dietPlan(yes):- 
writeln('fitbot diet plan provides a healthy lifestyle without deprivation for your first journey for loosing weight. '),

writeln(' choose your breakfast for one week: '),
  (   (   breakfast(X,Y),nl , write(X),write('- '), printlist(Y),fail);true),nl,
  writeln(' choose your breakfast (sunday): '),read(A1),
  writeln(' choose your breakfast (monday): '),read(A2),
  writeln(' choose your breakfast (tuesday): '),read(A3),
  writeln(' choose your breakfast (wednesday): '),read(A4),
  writeln(' choose your breakfast (thursday): '),read(A5),
  writeln(' choose your breakfast (friday): '),read(A6),
  writeln(' choose your breakfast (saturday): '),read(A7),
  
  writeln(' choose your lunch for one week: '),
(   (   lunch(X,Y),nl , write(X),write('- '), printlist(Y),fail);true),nl,
  writeln(' choose your lunch (sunday): '),read(B1),
  writeln(' choose your lunch (monday): '),read(B2),
  writeln(' choose your lunch (tuesday): '),read(B3),
  writeln(' choose your lunch (wednesday): '),read(B4),
  writeln(' choose your lunch (thursday): '),read(B5),
  writeln(' choose your lunch (friday): '),read(B6),
  writeln(' choose your lunch (saturday): '),read(B7),
  writeln('your diet plan for one week: '),
  
   writeln(' choose your dinner for one week: '),
(   (   dinner(X,Y),nl , write(X),write('- '), printlist(Y),fail);true),nl,
  writeln(' choose your dinner (sunday): '),read(C1),
  writeln(' choose your dinner (monday): '),read(C2),
  writeln(' choose your dinner (tuesday): '),read(C3),
  writeln(' choose your dinner (wednesday): '),read(C4),
  writeln(' choose your dinner (thursday): '),read(C5),
  writeln(' choose your dinner (friday): '),read(C6),
  writeln(' choose your dinner (saturday): '),read(C7),
  
  nl,write('your diet plan for one week: '),
  printDiet(A1,A2,A3,A4,A5,A6,A7,B1,B2,B3,B4,B5,B6,B7,C1,C2,C3,C4,C5,C6,C7).
  
  printlist([X|List]) :- write(X),write(', '), printlist(List).

   printDiet(A1,A2,A3,A4,A5,A6,A7,B1,B2,B3,B4,B5,B6,B7,C1,C2,C3,C4,C5,C6,C7):- 
     nl,write('sunday:'),
    (( breakfast(A1,Y),nl ,write('1- '), printlist(Y),fail);true),
    (( lunch(B1,Y),nl ,write('2- '), printlist(Y),fail);true),
    (( dinner(C1,Y),nl ,write('3- '), printlist(Y),fail);true),
    nl,write('monday:'),
    (( breakfast(A2,Y),nl ,write('1- '), printlist(Y),fail);true),
    (( lunch(B2,Y),nl ,write('2- '), printlist(Y),fail);true),
    (( dinner(C2,Y),nl ,write('3- '), printlist(Y),fail);true),
    nl,write('tuesday:'),
    (( breakfast(A3,Y),nl ,write('1- '), printlist(Y),fail);true),
    (( lunch(B3,Y),nl ,write('2- '), printlist(Y),fail);true),
    (( dinner(C3,Y),nl ,write('3- '), printlist(Y),fail);true),
    nl,write('wednesday:'),
    (( breakfast(A4,Y),nl ,write('1- '), printlist(Y),fail);true),
    (( lunch(B4,Y),nl ,write('2- '), printlist(Y),fail);true),
    (( dinner(C4,Y),nl ,write('3- '), printlist(Y),fail);true),
    nl,write('thursday:'),
    (( breakfast(A5,Y),nl ,write('1- '), printlist(Y),fail);true),
    (( lunch(B5,Y),nl ,write('2- '), printlist(Y),fail);true),
    (( dinner(C5,Y),nl ,write('3- '), printlist(Y),fail);true),
    nl,write('friday:'),
    (( breakfast(A6,Y),nl ,write('1- '), printlist(Y),fail);true),
    (( lunch(B6,Y),nl ,write('2- '), printlist(Y),fail);true),
    (( dinner(C6,Y),nl ,write('3- '), printlist(Y),fail);true),
    nl,write('saturday:'),
    (( breakfast(A7,Y),nl ,write('1- '), printlist(Y),fail);true),
    (( lunch(B7,Y),nl ,write('2- '), printlist(Y),fail);true),
    (( dinner(C7,Y),nl ,write('3- '), printlist(Y),fail);true),
    nl,nl, write('you can repeat this plan for multiple weeks or you can choose new one agian. '),
    nl, write('thank you.'), menu.


workoutPlan(loss):- 
nl,writeln('  ***  WEEK #1  ***'),
writeln('4 cardio sessions. 25, 27, 25 and 27 minutes.'),
writeln('  ***  WEEK #2  ***'),
writeln('4 cardio sessions. 20, 22, 20 and 22 minutes.'),
writeln('  ***  WEEK #3  ***'),
writeln('3 cardio sessions. 15, 20 and 15 minutes.'),
writeln('  ***  WEEK #4  ***'),
writeln('3 cardio sessions. 10, 12 and 10 minutes.'),
writeln('  ***  WEEK #5  ***'),
writeln('3 cardio sessions. 5, 8 and 5 minutes.').

workoutPlan(gain):- 
nl,writeln('  ***  WEEK #1  ***'),
writeln('Barbell Squat. 3 sets, 6 reps.'),
writeln('  ***  WEEK #2  ***'),
writeln('Dumbbell Bench Press. 3 sets, 8 reps.'),
writeln('  ***  WEEK #3  ***'),
writeln('Bent Over Barbell Row. 3 sets, 8 reps.'),
writeln('  ***  WEEK #4  ***'),
writeln('Seated Barbell Military Press. 2 sets, 10 reps.'),
writeln('  ***  WEEK #5  ***'),
writeln('Seated Calf Raise. 2 sets, 15 reps.').

printGyms(X):- 
(gym(X,Y,Z),writeln(Y),writeln(Z),fail);true.
