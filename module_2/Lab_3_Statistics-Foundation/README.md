![logo_ironhack_blue 7](https://user-images.githubusercontent.com/23629340/40541063-a07a0a8a-601a-11e8-91b5-2f13e4e6b441.png)

# Lab | Statistics Foundations
In this lab we are going to put into practice what we learned about the foundations of statistics. You won't need to use Python, just your brain and a little bit of *Markdown*. Hovewer, you will need SQL for the Part 3.

## Your task
Today you'll need to complete the challenges described below.

## Deliverables
You need to submit a markdown file with the solution to the following challenges. You can create a new *.md* file or directly edit the *README.md* to include your solutions.
This file should also include the SQL script for the Part 3.

## Challenges
## Part 1
### Challenge 1
Find a and b, if median=42, mean=50  
20,34, 34,  12, 56, 110, 49, a, b.  
  
WLOG let a = 42, then b = 50*9 - sum([20,34,34,12,56,110,49,42])  
b = 93

### Challenge 2
A car hit an average speed of v1 = 60 kmph in the first half of the journey, and hit an average speed of v2 = 110 kmph in the second half of the journey. Determine the average speed of the car.  
  
This is impossible to answer since no precise units are given. If the 'half' refers to time, then the average speed of the car is simply 85kmph. However, if the 'half' refers to meters or km (distance), then the average speed would be 77.65 kmph.  

### Challenge 3
The lifetimes of 400 light-bulbs were found to the nearest hour. The results were recorded as
follows.
Lifetime (hours) 0–199 200–399 400–599 600–799 800–999 1000–1199 1200–1999
Frequency         143     97      64      51      14      14        17
Construct a histogram and cumulative frequency polygon for this dataset. Estimate the percentage
of bulbs with lifetime less than 480 hours.   
I would give and estimation of 67.5%  
![histbutreallybar](./hist.jpg)
![cumulative](./cum_hist.jpg)

### Challenge 4
The time between arrival of 60 patients at an intensive care unit were recorded to the nearest hour.
The data are shown below.
Time (hours) 0–19 20–39 40–59 60–79 80–99 100–119 120–139 140–159 160–179
Frequency     16    13    17    4     4      3       1      1       1
Determine the median, mean and standard deviation for this dataset.  
mean = 47  
median = 50.0  
stdev = 36.790750495659886  

## Part 2
### Challenge 1
One player rolls two dices. Describe the measurable space and the random variable for:
* A. The values that the player obtains.  
  
  $\\Omega = \\{ (1,1), (1,2), (1,3), (1,4), (1,5), (1,6), (2,2), (2,3), (2,4), (2,5), (2,6), (3,3), (3,4), (3,5), (3,6), (4,4), (4,5), (4,6), (5,5), (5,6), (6,6) \\} $
* B. The sum of the values obtained.  
  
  $\\Omega = \\{ 2,3,4,5,6,7,8,9,10,11,12 \\}  $
* C. The maximum value obtained after rolling both dices.  
  
  $\\Omega = \\{ 1,2,3,4,5,6 \\}  $
  
Describe the following events:  
* Case A: Both values are greater than 5.  
  
  $x1= \\{ 5,6 \\} \\cap x2=\\{ 5,6 \\} $  
* Case B: The sum of values is even.  
  
  $(x1,x2) = \\{ (1,1), (1,3), (1,5), (2,2), (2,4), (2,6), (3,3), (3,5), (4,4), (4,6), (5,5), (6,6) \\}$  
* Case C: The maximum is the value of both rolls.  
  
  $(x1,x2) = \\{ (1,1), (2,2), (3,3), (4,4), (5,5), (6,6) \\}$  

### Challenge 2
One player picks two cards from a poker deck. Describe the measurable space and the random variable for:
* A. The number of figures he picks.  
  
  $\\Omega_1 = \\{0,1,2\\}$  
* B. The sum of card values. Consider that the value of figures is 10 and the value of aces is 15.  
  
  $\\Omega_2 = \\{ 4,5,6,7,8,9,10,12,13,14,15,16,17,18,19,20,21,22,23,24,25\\}  $
* C. The number of hearts or spades he picks.  
  
  $\\Omega_3 = \\{ 0,1,2  \\}  $

Describe the following events:
* Case A: The number of figures in the cards the player picked is two.  
  
  $x = \\{2, x \\in \\Omega_1 \\}$  
* Case B: The sum of card values is 17.  
  
  $s = \\{17 | s \\in \\Omega_2 \\}$  
* Case C: The value of both cards is less than 8.  
  
  $(x,y) = \\{(v,w) | v,w < 8 , v,w \\in Cards \\} $

### Challenge 3
Two players roll a dice. Describe the measurable space and the random variable for:  
  
  We are going to assume that score means sum and not some other arbitrary scoring.  
* A. The score of player A.  
  
  $\\Omega_1 = \\{ 2,3,4,5,6,7,8,9,10,11,12 \\}  $  
* B. The greatest score.  
  
  $\\Omega_2 = \\{ 2,3,4,5,6,7,8,9,10,11,12 \\}  $  
* C. The earnings of player A if the game rules state that:  
"The player with the greatest score gets a coin from the other player.".  
  
  $\\Omega = \\{ nothing, coin \\}  $  
* D. The earnings of player A if the game rules state that:  
"The player with the greatest score gets as many coins as the difference between the score of player A and player B.".   
  
  $\\Omega_3 = \\{-1,-2,-3,-4,-5,-6,-7,-8,-9,-10,-11,0,1,2,3,4,5,6,7,8,9,10,11 \\}  $  


Describe the following events:
* Case A: The score of player A is 2.  
  
  $x=\\{2| x \in \Omega_1 \\}$  

* Case B: The greatest score is lower or equal than 2.  
  
  $x= \\{ v<=2 | v \in \Omega_2  \\}  $

* Case C: Considering the case where the winner gets as many coins as the difference between scores (D), describe: 
  * Player A wins at least 4 coins.  
    
  $ x = \\{ v>=4 | v \in \Omega_3 \\}$  

  * Player A loses more than 2 coins.  

    $x = \\{v< -2  | v \in \Omega_3 \\} $
  * Player A neither wins nor loses coins.  
    
    $x = \\{v=0  | v \in \Omega_3 \\} $  

## Bonus challenges
### Bonus Challenge 1
Three players take balls from a box. Inside that box there are red, blue, green and black balls. The players can take three balls at mosts with the following rules:

* If the ball is blue, they can take another ball.
* If the ball is green, they get one point and they can take another ball.
* If the ball is red, they can’t take another ball.
* If the ball is black, they lose one point and they can’t take another ball.

Describe the measurable space and the random variable for:
* A. Player A wins. Do not consider ties as a win.
* B. Player A and B get the same points.
* C. All players get 0 points.

### Bonus Challenge 2
Consider the situation of bonus challenge 1 but now with four players. Does anything change in your solutions? What are the changes in each case?

### Bonus Challenge 3
One player takes three balls from a box. Inside the box there are 5 balls: two of them are black and the other three are white. 

Describe the measurable space and the random variable for:
* A. The number of white balls if every time we take a ball we keep it.
* B. The number of white balls if every time we take a ball we put it back again into the box.
* C. The number of black balls if every time we take a ball we keep it.
* D. The number of black balls if every time we take a ball we put it back into the box.

| Attempt | #1 | #2 |
| :---: | :---: | :---: |
| Seconds | 301 | 283 |

## Part 3
### Challenge 1

| #student_id | #score |
| :---------: | :----: |
| 1 | 91 |
| 2 | 72 |
| 3 | 98 |
| 4 | 62 |
| 5 | 62 |
| 6 | 95 |
| 7 | 83 |
| 8 | 86 |
| 9 | 56 |
|10 | 97 |
|11 | 58 |
|12 | 71 |
|13 | 87 |
|14 | 83 |
|15 | 98 |


Please find MEAN, SUM, STANDARD DEVIATION, VARIANCE, MIN and MAX.
