####__Kagome Higurashi from Inuyasha: Sengoku Otogi Kassen__  
#####Version ?.?? for M.U.G.E.N 1.1  
######*Ported by VinnyJ*  

~vincej.piiym.net~
* http://www.twitch.tv/entec4
* https://github.com/vinnyj/mugen-kagome

#####_Feedback and Comments?_
Tweet or DM me on Twitter:
[subvertedheart](https://twitter.com/subvertedheart)
##Comments from 2015:

It has been a long time.

I plan to update her to M.U.G.E.N. 1.1 standards, fix any dumb mistakes and clean up code.
- Initial commit = 2007 Version

##Known Issues from 2007:

1. A last minute change in the main palette, negatively affected the other palettes.
The addition colors for the backpack, caused earlier color separation work to fail.
(Eye color is linked to her shirt and shoe to skin tone.)

2.  __Inuyasha-Specific__ : The "Sit Boy!" throw can miss, this is intentional behavior. No voice sample is played to reflect this.

##Notes:

Make sure you have the in_cube.dll adx winamp plugin in order to hear Kagome's Intro Storyboard.
If there is demand, an alternate audio format will be used.

##WIP Updates / TO DO Checklist
- [x] All Required Sprites<br />
- [x] All Basic Movement<br />
- [x] All Basic Attacks<br />
- [x] Intro,Lose,Win Animations<br />
- [x] All Special Moves<br />
- [x] Backpack throw (It still looks odd to me >:P)<br />
- [x] Super Arrow (Level 1 Super)<br />
- [x] English  Voice<br />
- [x] Japanese Voice<br />
- [x] Hit/Guard and other basic sounds<br />
- [x] "Sit Boy!" Throw vs Inuyasha<br />
- [x] Air Throw<br />
- [x] Intro Storyboard from PSOne fighter<br />
- [x] Removed an infinite in one of her Yasha combos<br />
- [x] Fixed Kagome Explosion spark, bound it to Kagome -Thanks Kung Fu Man for spotting that<br />
- [x]  Added Hyper Image (Purely Cosmetic)<br />
- [ ]  Groped by Miroku<br />
- [ ]  Added an additional intro anim(vs Kikyo sound)<br />
- [ ] Tightened the timings on Yasha Combos<br />
- [ ] Corrected palette by separating colors on sprites<br />
- [ ] Ending<br />
- [ ] Midnight Bliss & Sexy KO<br />
- [ ] MUGEN 1.1 Fixes<br />

####1.6 Updates
> Changed Volume to 0 from 255 in CNS <br />
Raised Kagome's Max Power stock to 3000 from 1000 (Back to MUGEN's default :p)<br />
Fixed Sound Trigger for DrLight palette, it kept playing multiple times overlapping itself. <br />
Fixed Sound Trigger when partner gets KO'ed, it would also overlap itself.<br />
Tiny .cmd fixes <br />
Changed a few sounds (English Sounds mostly.)<br />
Added Winane's AI activation code (XOR version)<br />
Added a few simple AI Commands using the above method. (She should put up a better fight.)<br />
Small Poweradd bugfix.  -Thanks RicePigeon<br />

####1.5 Updates
>Added Air Throw<br />
Tweaked some velocities and other small details<br />
Hit/Guard sounds from game of Origin<br />
Added Sit Throw vs Inuyasha<br />
More Sounds added (both Japanese and English)<br />
Added Intro Storyboard from PSOne Fighter (ADX Sound)<br />

####1.02 Updates
>Slightly upped walk velocities<br />
(I didn't lower them as suggested, it's just too slow.)<br />
Added Clsn1Default for Arrow Projectile<br />
(I had only one CLSN1 for 1 of 3 frames, stupid me.)<br />
Sacred Arrow Super subtracts power when arrow is shot, not during attempt.<br />
(It's more fair for her this way, in my opinion.)<br />
draw.offset Y changed by 1 pixel<br /> 
(She was floating off the ground by 1 pixel. FIXED.)<br />

####1.01 Updates
> ~ Changed Triggers for Winposes, winpose shows up in "Congratulations" screen now. -Thanks Swamphunter<br />
~ JPN voice (edit .def file to use)<br />
~ Fixed small transparency error in her mouth during her Intro, because of pcxclean. :S<br />
~ Other small tweaks<br />

###Kagome FAQs
Q. __How can I use her English Voice?__ <br />
A. _Open __Kagome.def__ in Notepad and edit the __"sound ="__ line, like this:_<br />
>__sound = Kagome.snd__       ;English sound File<br />
;__sound = Kagome_JPN.snd__   ;Japanese sound File<br />

_Remember to add a semi-colon to the beginning of the other "sound =" line, so it ignores it._

