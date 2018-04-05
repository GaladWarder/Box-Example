VAR apples = 0
VAR pineapples = 0
VAR boxA = false
VAR boxB = false
VAR boxC = false

->box_example

===function open_boxA()
//add the contents
~apples = apples + 1
~pineapples = pineapples + 4
//remove the option, since box A is already in box D
~boxA = true

===function open_boxB()
~apples = apples + 4
~boxB = true

===function open_boxC()
~pineapples = pineapples + 1
~boxC = true

===function remove_boxA()
//remove the contents
~apples = apples - 1
~pineapples = pineapples - 4
//add the option to the menu
~boxA = false

===function remove_boxB()
~apples = apples - 4
~boxB = false

===function remove_boxC()
~pineapples = pineapples - 1
~boxC = false


===box_example===
I open the door. Inside are four boxes.
I mark them A, B, C, and D.
I have decided to screw around with box D. 
-(decision)What should I do?
//Added conditionals to the choices, if the box has been added, it takes away that option.
+   { not boxA }Add box A
    I open box A, and throw it into box D.
    {open_boxA()}
    
+   {not boxB }Add box B
    {open_boxB()}
    
+   {not boxC }Add box C
    {open_boxC()}
    
    //Likewise, if the box has not yet been added to D, it will not allow the player the option to remove.
+   { boxA }Remove box A
    {remove_boxA()}
+   { boxB }Remove box B
    {remove_boxB()}
    
+   { boxC }Remove box C
    {remove_boxC()}

-There are now {apples} apples and {pineapples} pineapples in Box D.
->decision
