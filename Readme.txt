-----------------------------------------------------------
Kagome Higurashi from Inuyasha: Sengoku Otogi Kassen (PsOne Fighter)
Version ??? for Windows M.U.G.E.N
-----------------------------------------------------------
"MUGENized" by VinceJ
http://www.mugenguild.net/~vincej/

Feedback and Comments?
Post in one of the Release Forum topics (Preferably MugenGuild, Randomselect, or MGBr)
or
visit the Lazy Dog Creations forums at my site.

=============
Known Issues:
=============
1.
On some frames there are pixels missing on her bow or bow string, I fixed this by editing some
connecting pixels on her basic movement sprites.
As I kept ripping more and more sprites, I noticed the same pixels missing on her bow/bow string
so, I just left them as-is on the rest.. too much work to do the same thing. :P
It's like this in the game of origin, I wonder why.

2.
Some required sprites are not in game of origin, so they were improvised.
Not as good as I wanted, but they'll be redone in a future version.
PSP7 is not good at rotating sprites.

3.
Other Palettes may look wrong, due to a last minute change in the palette. (Backpack Colors added.)
Also, Sprites use older palette, where the eye is linked to her shirt and shoe is to skin tone.
Will be fixed in a later version.

4.
The "Sit Boy!" throw can miss, so that's why there is no "sit" voice, when Inuyasha manages to dodge it.


========
Notes:
========
Make sure you have the in_cube.dll adx winamp plugin in order to hear Kagome's Intro Storyboard.
I can make an mp3 version of the storyboard audio, if the demand is high enough.

=================
WIP Updates
=================
Removed an infinite in one of her Yasha combos
Fixed Kagome Explosion spark, bound it to Kagome -Thanks Kung Fu Man for spotting that
Added Hyper Image (Purely Cosmetic)
TODO: Groped by Miroku
TODO: Added an additional intro anim(vs Kikyo sound)
TODO: Tightened the timings on Yasha Combos
TODO: Corrected palette by separating colors on sprites
TODO: Ending
TODO: Midnight Bliss & Sexy KO
TODO: 

=================
1.6 Updates
=================
Changed Volume to 0 from 255 in CNS (I don't think it makes a difference)
Raised Kagome's Max Power stock to 3000 from 1000 (Back to MUGEN's default :P)
Fixed Sound Trigger for DrLight palette, it kept playing multiple times overlapping itself.
Fixed Sound Trigger when partner gets KO'ed, it would also overlap itself.
Tiny .cmd fixes
Changed a few sounds (English Sounds mostly.)
Added Winane's AI activation code (XOR version)
Added a few simple AI Commands using the above method. (She should put up a better fight.)
Small Poweradd bugfix.  -Thanks RicePigeon


=================
1.5 Updates
=================
Added Air Throw
Tweaked some velocities and other small details
Hit/Guard sounds from game of Origin
Added Sit Throw vs Inuyasha
More Sounds added (both Japanese and English)
Added Intro Storyboard from PSOne Fighter (ADX Sound)

=================
1.02 Updates
=================
Slightly upped walk velocities
(I didn't lower them as suggested, it's just too slow.)

Added Clsn1Default for Arrow Projectile
(I had only one CLSN1 for 1 of 3 frames, stupid me.)

Sacred Arrow Super subtracts power when arrow is shot, not during attempt.
(It's more fair for her this way, in my opinion.)

draw.offset Y changed by 1 pixel 
(She was floating off the ground by 1 pixel. FIXED.)

==========================
1.01 Updates
==========================
Changed Triggers for Winposes, winpose shows up in "Congratulations" screen now. -Thanks Swamphunter
JPN voice (edit .def file to use)
Fixed small transparency error in her mouth during her Intro, because of pcxclean. :S
Other small tweaks


==========
What's In
==========
All Required Sprites
All Basic Movement
All Basic Attacks
Intro,Lose,Win Animations
All Special Moves
Backpack throw (It still looks odd to me >:P)
Super Arrow (Level 1 Super)
English  Voice
Japanese Voice
Hit/Guard and other basic sounds
"Sit Boy!" Throw vs Inuyasha
Air Throw
Intro Storyboard from PSOne fighter

====================
What's left?
====================
-Edit Sprites palettes to use final palette
(Probably Won't do it, because going through 800 sprites just to fix a palette is hell.)

-Ending

-Grope Animation vs Miroku
(Held off until Miroku actually gropes women in Mugen)

-Anything Else that comes to mind.

==============
 Kagome FAQs
==============
Q. How can I use her English Voice?

A. open Kagome.def in Notepad and edit the "sound =" line, like this:


sound = Kagome.snd      ;English sound File
;sound = Kagome_JPN.snd  ;Japanese sound File

Remember to add a semi-colon to the beginning of the other "sound =" line, so it ignores it.



------------------------------------------------------------------------------------
Controls are set up for a Gamepad, like a PS1 or PS2 controller.
Square   = X
Triangle = Y
X        = A
Circle   = B
R1       = Z
L1       = C
Start    = Start

So the controls match the original game.
Though, you can always remap the character in the [Remap] section of the CMD file.
------------------------------------------------------------------------------------

========
MOVELIST
========
U - Up
D - Down
F - Forward
B - Back

Z - Dash Left  (while dashing, tap to attack)
Y - Weak attack 
C - Dash Right (while dashing, tap to attack)
X - Special attack
A - Parry      (NOT IMPLEMENTED YET)
B - Strong Attack

START - No Use

=============
Special Moves
=============

    X  - Energy Ball
B + X  - Spirit Energy Explosion
F + X  - Purification Arrow

===============
Super Move List
===============
D,D, X - Sacred Arrow

============
Yasha Combos
============
Mix light and heavy attacks to get a Yasha Combo.
You can combo standing to crouching and vice-versa.
The combo ends with the Energy Ball 

====================
Greets & Thank you:
====================

Beat92Box           - Palette Submissions (Not included, but soon.)
Jared               - Palette Submissions
Kung Fu Man         - Palette Submission
LadyKiKi            - Palette Submission

LegatoB             - Come back to MUGEN and finish up that Miroku or I'll have to!
                    - Used some code from his Miroku and Ryouga WITH PERMISSION, tweaked for Kagome.
                    - Palette Submissions

Messatsu            - Palette Submission
Psicoso             - Palette Submissions
ShoShingo           - Palette Submissions
The Dreamslayer     - Artmoney Advice
GohanSSM2           - Feedback
Kung Fu Man         - Feedback


=====================================================
Character created with help from the following tools:
=====================================================
Pcxclean
SprMaker + .txt file  + .bat file
SndMaker + .txt file  + .bat file
AirEdit
Notepad (CNS,ST,DEF,CMD,AIR tweaking)


=============
   CREDITS
=============
VinnyJ / VinceJ                  - It's me, dammit.
                                   For hours of searching/filtering addresses in Artmoney
                                   to create a table and get Anim codes from the game. @_@;


Xeven                            - For his PSX Emulator - PSXEVEN
                                 - http://batard.psxfanatics.com/

Pete Bernert
and
P.E.Op.S Developers              - For the Excellent P.E.Op.S GPU & SPU plugins
                                 - http://sourceforge.net/projects/peops

System SoftLab, Artyom Mikhailov - For Artmoney Pro
                                 - http://www.artmoney.ru/

HUMANBALANCE Co.                 - For Graphics Gale
                                 - http://www.humanbalance.net/gale/us/

Jasc                             - For PSP7 and Animation Shop
                                 - http://www.corel.com  (jasc.com is gone.)

Ragnarok Nemo                    - For MEE (Preliminary sprite alignment)
SNK/Playmore                     - Andy Bogard energy ball effect and Matrimelee stress spark.
Megaman-sprites.com              - Took Heatnix effect from X6 section, edited slightly for Super Arrow Effect

Winane                           - AI Activation code and the helpful comments within the AIComponent files
The Necromancer                  - For the old AI Tutorial on Blargh-net, which used Roken's VKen as a teaching tool.

================
SPECIAL CREDITS
================
Bandai           - For Inuyasha: Feudal Combat & Inuyasha: The Secret of the Cursed Mask
Dimps            - For a great game, "Inuyasha: Sengoku Otogi Kassen"
Rumiko Takahashi - For her greatest work yet, Inuyasha 

ELECBYTE         - For the greatest engine around, M.U.G.E.N
                 - M.U.G.E.N tools: Pcxclean, Airedit, Sprmaker, and sndmaker

