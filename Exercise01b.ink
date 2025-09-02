/*
This is a comment block. It won't be read as an Ink story.
Comments are very useful for leaving ideas for story and functionalty

This exercise will demonstrate the following in the example video:
 - Basic Choices
 - Knot structure
 - Recurring choices
 - Conditionals in descriptions
 - Conditionals in choices
 
 In the assignment:
 - Add four more knots (and feel free to change any of the example text, this is YOUR story)
 - Add at least one more conditional
*/

-> Cave_mouth

== Cave_mouth ==
You are at the entrance to a cave. {Torch: | There is a torch on the floor.} The cave extends to the east and west.
+ {not East_lit && not West_lit} [Take the East Tunnel] -> East
+ {East_lit or West_lit} [Take the East Tunnel] -> East_lit
+ {not West_lit && not East_lit} [Take the West Tunnel] -> West
+ {East_lit or West_lit} [Take the West Tunnel] -> West_lit
* [Pick up the Torch] -> Torch
* {Coins or Grab_Crown or Dragon_dies} [Return Home (End the Game)] -> ScoreBoard

== ScoreBoard ==
You return home with your new found riches: 
{Coins: A pocket full of coins | } 
{Grab_Crown: A Crown | }
{Dragon_dies: A Dragon Head | }
{Sword: A Magnificent Sword | }
-> END

=== Torch ===
You now have a torch! May it light the way!
* [Go Back] -> Cave_mouth


== East ==
You are in the East. It is very dark, you can't see anything.
* {Torch && (not West_lit)} [Light Torch] -> East_lit
+ [Go Back] -> Cave_mouth

== East_lit ==
You enter a cavern and you see the glints of thousands of coins in the cave.
* [Take a pocket full of coins] -> Coins
+ [Continue onwards] -> East_2
+ [Go Back] -> Cave_mouth

== Coins ==
You now have a pocket full of coins.
+ [Go Back] -> East_lit

== East_2 ==
This is another cavern filled with treasure. There is a giant pile of coins and other rare items in the center of the room. You see {Sword: | a magnificent sword stuck in} a skeleton at the top of the treasure pile.
* [Grab the Sword] -> Sword
+ [Go Back] -> East_lit

== Sword ==
You grab the Sword and stow it for later.
+ [Go Back] -> East_lit

== West ==
You are in the West. It is very dark, you can't see anything.
* {Torch && (not East_lit)} [Light Torch] -> West_lit
+ [Go Back] -> Cave_mouth


== West_lit ==
You see what appears to be a slumbering Dragon guarding a crown.
* [Fight the Dragon] -> Dragon_Fight
* {Coins} [Sneak towards the Dragon] -> Dragon_coins
* {not Coins} [Sneak towards the Dragon] -> Crown
+ [Go Back] -> Cave_mouth

== Crown ==
You are now close to the dragon and the crown.
* [Grab the Crown] -> Grab_Crown
* [Touch Dragon] -> Dragon_awakens

== Grab_Crown ==
You grab the crown
* {not Dragon_dies} [Touch the Dragon] -> Dragon_awakens
* [{Dragon_dies: Return back victorous! | Sneak back to the Cave Mouth}] -> Cave_mouth

== Dragon_coins ==
The coins in your pocket make noise as you move. <>
-> Dragon_awakens

== Dragon_awakens ==
The Dragon is awake and now looking you dead in your eyes.
* [Fight the Dragon] -> Dragon_Fight


== Dragon_Fight ==
The Dragon is about to breath fire towards you!
* [Roll Left] -> Roll_left
* [Roll Right] -> Roll_right

== Roll_left ==
You roll left, narrowly avoiding the Dragon's scorching breath! 
* {not Sword} [Slay the Dragon] -> No_Sword
* {Sword} [Slay the Dragon] -> Dragon_dies
* [Run from the Dragon] -> Cave_mouth

== Roll_right ==
You roll right into the Dragon's scorching breath and become a burnt chicken nugget.
-> END

== No_Sword ==
You go to slay the Dragon but quickly realize you have no weapon. The Dragon then scorches you with its breath and you become a burnt chicken nugget.
-> END

== Dragon_dies ==
You sucessfully slayed the Dragon using your Magnificent Sword and take the Dragon's head with you.
*[Grab the Crown] -> Grab_Crown


