;        The CMD file.
;   old_button = new_button
[Remap]
x = x
y = y
z = z
a = a
b = b
c = c
s = s

;-| Default Values |-------------------------------------------------------
[Defaults]
; Default value for the "time" parameter of a Command. Minimum 1.
command.time = 15

; Default value for the "buffer.time" parameter of a Command. Minimum 1,
; maximum 30.
command.buffer.time = 1

;-| Single Button |---------------------------------------------------------
[Command]
name = "a"
command = a
time = 1

[Command]
name = "b"
command = b
time = 1

[Command]
name = "c"
command = c
time = 1

[Command]
name = "x"
command = x
time = 1

[Command]
name = "y"
command = y
time = 1

[Command]
name = "z"
command = z
time = 1

[Command]
name = "start"
command = s
time = 1

;-| Hold Dir |--------------------------------------------------------------
[Command]
name = "holdfwd";Required (do not remove)
command = /$F
time = 1

[Command]
name = "holdback";Required (do not remove)
command = /$B
time = 1

[Command]
name = "holdup" ;Required (do not remove)
command = /$U
time = 1

[Command]
name = "holddown";Required (do not remove)
command = /$D
time = 1

;-| Hold Button |----------------------------------------------------------
; Please define Anim 74140108 in your AIR file if AND ONLY IF you place these
; 7 Hold Button commands immediately after the 11 Single Button and Hold Dir
; commands at the very top of your CMD list, as demonstrated here.
; In this version of the AI code, these commands are only used by the XOR
; method, and thus are optional.  But there remains a possibility that a
; future version of the helper method might be helped by having these
; commands placed here, and Anim 74140108 would then be used to indicate
; that a partner character has a compatible CMD.

[Command]
name = "holda"
command = /a
time = 1

[Command]
name = "holdb"
command = /b
time = 1

[Command]
name = "holdc"
command = /c
time = 1

[Command]
name = "holdx"
command = /x
time = 1

[Command]
name = "holdy"
command = /y
time = 1

[Command]
name = "holdz"
command = /z
time = 1

[Command]
name = "holdstart"
command = /s
time = 1

;--- None of your own command definitions should be above this line. ---

;-| CPU |--------------------------------------------------------------
; Note that if you make any changes to the basic one-button or recovery
; commands, you'll need to make the same changes to their matching commands here
; and/or in the XOR VarSet controller.  That includes things like, for example:
;  * changing the recovery command to use a different combination of buttons.
;  * renaming the b button command as "d", or the start button command as "s".
;  * switching the button names around, e.g. so button y triggers "a" and button a triggers "y".
;  * having more than one way to trigger the same command name.
; If you understand how the XOR method works, the proper changes should be obvious.
; If you don't understand it, then simply disable the lines in the XOR VarSet
; controller that correspond to the commands you've altered.

[Command]
name = "a2"
command = a
time = 1

[Command]
name = "b2"
command = b
time = 1

[Command]
name = "c2"
command = c
time = 1

[Command]
name = "x2"
command = x
time = 1

[Command]
name = "y2"
command = y
time = 1

[Command]
name = "z2"
command = z
time = 1

[Command]
name = "start2"
command = s
time = 1

[Command]
name = "holdfwd2"
command = /$F
time = 1

[Command]
name = "holdback2"
command = /$B
time = 1

[Command]
name = "holdup2"
command = /$U
time = 1

[Command]
name = "holddown2"
command = /$D
time = 1

[Command]
name = "holda2"
command = /a
time = 1

[Command]
name = "holdb2"
command = /b
time = 1

[Command]
name = "holdc2"
command = /c
time = 1

[Command]
name = "holdx2"
command = /x
time = 1

[Command]
name = "holdy2"
command = /y
time = 1

[Command]
name = "holdz2"
command = /z
time = 1

[Command]
name = "holdstart2"
command = /s
time = 1

[Command]
name = "recovery2"
command = x+y
time = 1

; Here add matching commands for any moves that must never be used randomly
; by the computer, such as suicide moves and super moves, and add the pairs
; to the XOR VarSet controller in State -3.

; If you're desperate to make sure that the AI always gets turned on as soon
; as possible, you can add more equivalents for your own commands here too,
; and add to the XOR VarSet controller's triggers accordingly.

; And of course, if you've run out of unique command labels (Mugen allows
; 128), you can remove as many of these as you want.  You'll of course need
; to modify the XOR VarSet controller's triggers accordingly, but Mugen
; will let you know if you forget to do so. :)


;-| Double Tap |-----------------------------------------------------------
[Command]
name = "FF"     ;Required (do not remove)
command = F, F
time = 10
buffer.time = 3

[Command]
name = "BB"     ;Required (do not remove)
command = B, B
time = 10
buffer.time = 3

;-| 2/3 Button Combination |-----------------------------------------------
[Command]
name = "recovery";Required (do not remove)
command = x+y
time = 1

;-| Dir + Button |---------------------------------------------------------
[Command]
name = "down_a"
command = /$D,a
time = 1

[Command]
name = "down_b"
command = /$D,b
time = 1

;===================

;Super Arrow
[Command]
name = "s_arrow"
command = D,D, x
buffer.time = 1

;Super Arrow
[Command]
name = "s_arrow"
command = D,/D, x
buffer.time = 1

;Super Arrow
[Command]
name = "s_arrow"
command = D, ~D, D, ~D, x
buffer.time = 1

;Arrow Shoot
[Command]
name = "arrow_shoot"
command = /F, x
time = 10

;Angry Explosion
[Command]
name = "angry_exp"
command = /B, x
time = 10

[Statedef -1]

; The main purpose of having these next two controllers here at the top of
; StateDef -1 is to make sure the AI helper never changes to a different state,
; but they also improve efficiency by preventing Mugen from wasting time
; processing the entire State -1 for the helper.
[State -1, AI Helper Check]
type = ChangeState
trigger1 = IsHelper(9741)
value = 9741

[State -1, AI Helper Check 2]
type = ChangeState
trigger1 = IsHelper(9742)
value = 9742

; This is generally the best place to put most of your AI directives.  For
; example, this controller would only be executed when the CPU is in control:
;
; [State -1, Haha!]
; type = ChangeState
; trigger1 = var(0) ; (Or use "var(58)>0" if you've chosen not to
;                   ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = StateType = S
; trigger1 = MoveType = I
; trigger1 = P2MoveType = H
; trigger1 = NumEnemy = 1
; trigger1 = Enemy,GetHitVar(HitTime) > 60
; trigger1 = PrevStateNo != 195
; trigger1 = Random < 99
; value = 195

; And of course, most human-only command-based ChangeStates also belong
; in State -1.  For example, this move would only be performable by a human:
;
; [State -1, Death Before Dishonor]
; type = ChangeState
; trigger1 = command = "suicide"
; trigger1 = !var(0) ; (Or use "var(58)<1" if you've chosen not to
;                    ; use the Simplifier variable/controller.)
; trigger1 = ctrl
; trigger1 = StateType != A
; trigger1 = MoveType = I
; value = {suicide state number}
;=================================================================
;Arrow Shoot via AI
[State -1, Bot Arrow Shoot]
type = ChangeState
value = 1000
triggerall =  var(0) && (P2Life > 0)
triggerall = statetype = S && Numproj < 1 ;&& command = "arrow_shoot"
trigger1 = (P2StateType != C) && (P2BodyDist X > 120) && (StateNo != 1000) && (Ctrl) && (Random <= 100)
trigger3 = (P2BodyDist X <= 120) && (P2BodyDist X >=30) && (ctrl) && (random <= 101)
;trigger4 = (enemy, numproj = 0) && (random <= 110) && (P2BodyDist x >= 150) && (ctrl)

;Ball Special via AI
[State -1, Ball Special]
type = ChangeState
value = 203
triggerall = var(0) && (P2Life > 0)
triggerall = statetype = S ;&& command = "x"
trigger1 = (EnemyNear, Pos Y >= -50) && (EnemyNear, Facing = Facing) && (ctrl) && (Random <= 120)
trigger2 = (Enemy, BackEdgeBodyDist < 30) && (P2Dist X < 50) && (P2MoveType !=A) && (ctrl) && (Random <= 109)
trigger3 = (P2BodyDist X = [31,50]) && (Ctrl) && (random <= 110)

;Angry Explosion via AI
[State -1, AngryExp]
type = ChangeState
value = 1500
triggerall = var(0) && (P2Life > 0)
triggerall = statetype = S && Numproj < 1 ;&& command = "angry_exp"
trigger1 = (P2BodyDist X = [15,30]) && (Ctrl) && (random <= 110)

;Backpack thrash via AI
[State -1, Backpack]
type = ChangeState
value = 800
triggerall = var(0)
triggerall = statetype = S && ctrl
triggerall = stateno != 800
triggerall = stateno != 100
triggerall = p2name != "Inuyasha by VinceJ"
trigger1 = p2bodydist X < 3 && (random <= 100)
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = (p2movetype != H)

;Air Throw via AI
[State -1, Air Throw]
type = ChangeState
value = 850
triggerall = var(0)
triggerall = statetype = A
triggerall = ctrl
triggerall = stateno != 850
triggerall = Pos Y <= -25
trigger1 = stateno != 100
trigger1 = p2bodydist X = [0,5]
trigger1 = p2statetype = A
trigger1 = p2movetype != H

;Sit Boy! via AI
[State -1, Osuwarii]
type = ChangeState
value = 517
triggerall = var(0)
triggerall = statetype = S
triggerall = ctrl
triggerall = (stateno != 100)
triggerall = stateno != [517,518]
triggerall = p2name = "Inuyasha by VinceJ"
;trigger1 = command = "holdfwd"
trigger1 = (p2bodydist X < 4)
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H || p2statetype != L

;Super Arrow via AI
[State -1, SuperArrow]
type = ChangeState
value = 2000
triggerall = var(0)
triggerall = statetype != A
triggerall = power >= 1000 && ctrl && (P2Life <= 500) && (random <= 286)
trigger1 = (enemy, numproj = 0) && (random <= 360) && (P2BodyDist x >= 160) && (ctrl) && (StateNo !=2000)
trigger2 = (P2StateType != C) && (P2Dist X > 120) && (StateNo != 2000) && (Ctrl) && (Random <= 120)

;==========================================================================
;Basics Attacks for AI, Prepping for Yasha combos START
;==========================================================================
; Standing Light Punch via AI
[State -1, SLP]
type = ChangeState
value = 200
triggerall = var(0)
triggerall = statetype != A
trigger1 = ctrl
trigger1 = P2BodyDist X < 10
trigger1 = (p2statetype = S) && (p2movetype != H)
trigger1 = random <= 330
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Stand Light Punch2 via AI
[State -1, SLP2]
type = ChangeState
value = 201
triggerall = var(0)
triggerall = (P2BodyDist X < 10) && (p2statetype != A)
;trigger1 = statetype = S
trigger1 = (Stateno = 200 || Stateno = 400) && time > 4
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Crouch Light Punch
[State -1, CLP]
type = ChangeState
value = 400
triggerall = var(0)
triggerall = (P2BodyDist X < 10) && (p2statetype != A)
trigger1 = statetype = C
trigger1 = ctrl
trigger1 = p2movetype != H
trigger1 = random <= 234
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Crouch Light Punch2
[State -1, CLP2]
type = ChangeState
value = 401
triggerall = var(0)
triggerall = P2BodyDist X < 10
;triggerall = statetype = C
trigger1 = (Stateno = 400 || Stateno = 200) && (p2statetype != A) && time > 4
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, SSP]
type = ChangeState
value = 210
triggerall = var(0)
triggerall = (P2BodyDist X < 25) && (p2statetype != A)
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = random <= 498
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Stand Strong Punch2
[State -1, SSP2]
type = ChangeState
value = 211
triggerall = var(0)
;trigger1 = statetype = S
trigger1 = (Stateno = 210) && (p2statetype != A) && time > 4
trigger1 = var(1) ;Use combo condition (above)

;Crouch Strong Punch
[State -1, CSP]
type = ChangeState
value = 410
triggerall = var(0)
triggerall = P2BodyDist X < 20
trigger1 = (statetype = C) && (p2movetype != H) && (p2statetype != A)
trigger1 = ctrl
trigger1 = random <= 592
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Crouch Strong Punch2
[State -1, CSP2]
type = ChangeState
value = 411
triggerall = var(0)
triggerall = P2BodyDist X < 20
;trigger1 = statetype = C && (p2statetype != A)
trigger1 = stateno = 410 && time > 4
trigger1 = var(1) ;Use combo condition (above)

;===========================================================================
;Basic Attacks for AI, Prepping for Yasha Combos END
;===========================================================================

;---------------------------------------------------------------------------
;Run Fwd
;ダッシュ
[State -1, Run Fwd]
type = ChangeState
value = 100
triggerall = !var(0) && (statetype = S) && (ctrl)
trigger1 = command = "FF" 
trigger2 = command = "c" && Facing = 1  ;Meant for Gamepads
trigger3 = command = "z" && Facing = -1 ;Meant for Gamepads

;---------------------------------------------------------------------------
;Run Back
;後退ダッシュ
[State -1, Run Back]
type = ChangeState
value = 105
triggerall = !var(0) && (statetype = S) && (ctrl)
trigger1 = command = "BB"
trigger2 = command = "z" && Facing = 1  ;Meant for Gamepads
trigger3 = command = "c" && Facing = -1 ;Meant for Gamepads

;===========================================================================
;This is not a move, but it sets up var(1) to be 1 if conditions are right
;for a combo into a special move (used below).
;Since a lot of special moves rely on the same conditions, this reduces
;redundant logic.
[State -1, Combo condition Reset]
type = VarSet
trigger1 = 1
var(1) = 0

[State -1, Combo condition Check]
type = VarSet
trigger1 = statetype != A
trigger1 = ctrl
trigger2 = (stateno = [200,252]) || (stateno = [400,452])
trigger2 = MoveHit
trigger3 = var(0) && MoveContact
var(1) = 1
;-------------------------------------------------------------------
;Sit Boy!
[State -1, Osuwarii]
type = ChangeState
value = 517
triggerall = !var(0)
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
triggerall = (stateno != 100)
triggerall = stateno != [517,518]
triggerall = p2name = "Inuyasha by VinceJ"
trigger1 = command = "holdfwd"
trigger1 = (p2bodydist X < 4)
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = p2movetype != H || p2statetype != L

;---------------------------------------------------------------------------
;Backpack thrash
[State -1, Backpack]
type = ChangeState
value = 800
triggerall = !var(0)
triggerall = command = "b"
triggerall = statetype = S
triggerall = ctrl
triggerall = stateno != 100
triggerall = p2name != "Inuyasha by VinceJ"
trigger1 = command = "holdfwd"
trigger1 = p2bodydist X < 3
trigger1 = (p2statetype = S) || (p2statetype = C)
trigger1 = (p2movetype != H)

;---------------------------------------------------------------------------
;Air Throw
[State -1, Air Throw]
type = ChangeState
value = 850
triggerall = !var(0)
triggerall = command = "b"
triggerall = statetype = A
triggerall = ctrl
triggerall = stateno != 850
triggerall = Pos Y <= -25
trigger1 = command = "holdfwd"
trigger1 = stateno != 100
trigger1 = p2bodydist X = [0,5]
trigger1 = p2statetype = A
trigger1 = p2movetype != H

;-----------------------------------------------------------------------------

;Arrow Shoot
[State -1, Arrow Shoot]
type = ChangeState
value = 1000
triggerall = command = "arrow_shoot" && ctrl && !var(0)
trigger1 = command != "holddown"
trigger1 = command != "holdback"
trigger1 = statetype = S
trigger1 = Numproj < 1

;Angry Explosion
[State -1, AngryExp]
type = ChangeState
value = 1500
triggerall = command = "angry_exp" && ctrl && !var(0)
trigger1 = command != "holddown"
trigger1 = command != "holdfwd"
trigger1 = statetype = S
trigger1 = Numproj < 1

;Super Arrow
[State -1, SuperArrow]
type = ChangeState
value = 2000
triggerall = command = "s_arrow" && ctrl && !var(0)
trigger1 = statetype != A
trigger1 = power >= 1000

;-------------------------------------------------------------------
;Stand Light Punch3
[State -1, Standing Light Punch3]
type = ChangeState
value = 202
triggerall = command = "y"
triggerall = command != "holddown"
;triggerall = statetype = S
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 201 || Stateno = 401)

;Standing Strong Punch3
[State -1, Stand Strong Punch3]
type = ChangeState
value = 212
triggerall = command = "b"
triggerall = command != "holddown"
;trigger1 = statetype = S
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 211 || Stateno = 411)
trigger2 = (Stateno = 202 || Stateno = 402)

;----------------------------------
;Crouch Light Punch3
[State -1, Crouch Light Punch3]
type = ChangeState
value = 402
triggerall = command = "y"
triggerall = command = "holddown"
;triggerall = statetype = C
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 401 || Stateno = 201)

;----------------------------------
;Crouch Strong Punch3
[State -1, Crouch Strong Punch3]
type = ChangeState
value = 412
triggerall = command = "b"
triggerall = command = "holddown"
;trigger1 = statetype = C
triggerall = var(1) ;Use combo condition (above)
trigger1 = (stateno = 411 || Stateno = 211)
trigger2 = (Stateno = 202 || Stateno = 402)

;----------------------------------
;Ball Special Combo
[State -1, Ball Special Combo]
type = ChangeState
value = 203
triggerall = (statetype = S || statetype = C)
triggerall = var(1) ; Use combo condition (above)
trigger1 = (Stateno = 202 || Stateno = 402)
trigger1 = command = "y"
trigger2 = (Stateno = 212 || Stateno = 412)
trigger2 = command = "b"

;----------------------------------
;Stand Light Punch
[State -1, Stand Light Punch]
type = ChangeState
value = 200
triggerall = !var(0)
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Stand Light Punch2
[State -1, Standing Light Punch2]
type = ChangeState
value = 201
triggerall = !var(0)
triggerall = command = "y"
triggerall = command != "holddown"
;triggerall = statetype = S
trigger1 = (Stateno = 200 || Stateno = 400)
trigger1 = var(1) ;Use combo condition (above)

;------------------------------------------------------
;Ball Special Standalone
[State -1, Ball Special]
type = ChangeState
value = 203
triggerall = !var(0)
triggerall = command != "holddown"
triggerall = command != "holdback"
triggerall = command != "holdfwd"
triggerall = (statetype = S || statetype = C)
trigger1 = command = "x" && ctrl

;----------------------------------
;Crouch Light Punch
[State -1, Crouch Light Punch]
type = ChangeState
value = 400
triggerall = !var(0)
triggerall = command = "y" && command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Crouch Light Punch2
[State -1, Crouch Light Punch2]
type = ChangeState
value = 401
triggerall = !var(0)
triggerall = command = "y"
triggerall = command = "holddown"
;triggerall = statetype = C
trigger1 = (Stateno = 400 || Stateno = 200)
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Jump Light Punch
[State -1, Jump Light Punch]
type = ChangeState
value = 600
triggerall = command = "y"
triggerall = Stateno != [100,101]
triggerall = Stateno != [105,106]
triggerall = Stateno != [620,621]
trigger1 = statetype = A
trigger1 = ctrl

;---------------------------------------------------------------------------
;Stand Strong Punch
[State -1, Stand Strong Punch]
type = ChangeState
value = 210
triggerall = !var(0)
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = statetype = S
trigger1 = ctrl
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Stand Strong Punch2
[State -1, Stand Strong Punch2]
type = ChangeState
value = 211
triggerall = !var(0)
triggerall = command = "b"
triggerall = command != "holddown"
;trigger1 = statetype = S
trigger1 = Stateno = 210
trigger1 = var(1) ;Use combo condition (above)

;Crouch Strong Punch
[State -1, Crouch Strong Punch]
type = ChangeState
value = 410
triggerall = !var(0)
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = statetype = C
trigger1 = ctrl
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Crouch Strong Punch2
[State -1, Crouch Strong Punch2]
type = ChangeState
value = 411
triggerall = !var(0)
triggerall = command = "b" && command = "holddown"
;trigger1 = statetype = C
trigger1 = stateno = 410
trigger1 = var(1) ;Use combo condition (above)

;---------------------------------------------------------------------------
;Jump Strong Punch
[State -1, Jump Strong Punch]
type = ChangeState
value = 610
triggerall = command = "b"
triggerall = Stateno != [100,101]
triggerall = Stateno != [105,106]
triggerall = Stateno != [620,621]
trigger1 = statetype = A
trigger1 = ctrl

;Dash Fwd Punch
[State -1, Dashfwd Punch]
type = ChangeState
value = 620
triggerall = stateno = 100
triggerall = statetype = A
triggerall = Pos Y != 0
trigger1 = command = "y"
trigger2 = command = "b"
trigger3 = command = "c" ;Meant for Gamepads
trigger4 = command = "z" ;Meant for Gamepads

;Dash Back Punch
[State -1, Dashback Punch]
type = ChangeState
value = 621
triggerall = stateno = 105
triggerall = statetype = A
triggerall = Pos Y != 0
trigger1 = command = "y"
trigger2 = command = "b"
trigger3 = command = "z" ;&& Facing = 1  ;Meant for Gamepads
trigger4 = command = "c" ;&& Facing = -1 ;Meant for Gamepads

;====================================
; DUPLICATES for Mixed Yasha combos
;====================================
;Stand Light Punch3 Duplicate for Yasha1
[State -1, Standing Light Punch3 Dupe]
type = ChangeState
value = 204
triggerall = command = "y"
triggerall = command != "holddown"
trigger1 = (Stateno = 212 || Stateno = 412)
trigger1 = var(1) ;Use combo condition (above)

;Standing Strong Punch3 Duplicate for yasha1
[State -1, Stand Strong Punch3 Dupe]
type = ChangeState
value = 224
triggerall = command = "b"
triggerall = command != "holddown"
trigger1 = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 204 || Stateno = 404)

;Ball Special Combo Duplicate
[State -1, Ball Special Combo Dupe]
type = ChangeState
value = 206
triggerall = (statetype = S || statetype = C)
triggerall = var(1) ; Use combo condition (above)
trigger1 = (Stateno = 224 || Stateno = 424)
trigger1 = command = "y" && command != "b"
trigger2 = (Stateno = 252 || Stateno = 452)
trigger2 = command = "b" && command != "y"

;Crouch Light Punch3 Duplicate
[State -1, Crouch Light Punch3 Dupe]
type = ChangeState
value = 404
triggerall = command = "y"
triggerall = command = "holddown"
trigger1 = (Stateno = 212 || Stateno = 412)
trigger1 = var(1) ;Use combo condition (above)

;Crouch Strong Punch3 Duplicate
[State -1, Crouch Strong Punch3 Dupe]
type = ChangeState
value = 424
triggerall = command = "b"
triggerall = command = "holddown"
trigger1 = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 204 || Stateno = 404)

;Stand Strong Punch2 Duplicate
[State -1, Stand Strong Punch2 Dupe]
type = ChangeState
value = 222
triggerall = command = "b"
triggerall = command != "holddown"
;trigger1 = statetype = S
trigger1 = (Stateno = 201 || Stateno = 401)
trigger1 = var(1) ;Use combo condition (above)

;----------------------------------
;Crouch Strong Punch2 Duplicate
[State -1, Crouch Strong Punch2 Dupe]
type = ChangeState
value = 422
triggerall = command = "b"
triggerall = command = "holddown"
;trigger1 = statetype = C
trigger1 = (stateno = 201 || Stateno = 401)
trigger1 = var(1) ;Use combo condition (above)

;Standing Strong Punch3 Duplicate
[State -1, Stand Strong Punch 236]
type = ChangeState
value = 236
triggerall = command = "b"
triggerall = command != "holddown"
;trigger1 = statetype = S
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 242 || Stateno = 442)

;----------------------------------
;Crouch Strong Punch3 Duplicate
[State -1, Crouch Strong Punch 436]
type = ChangeState
value = 436
triggerall = command = "b"
triggerall = command = "holddown"
;trigger1 = statetype = C
triggerall = var(1) ;Use combo condition (above)
trigger1 = (stateno = 442 || Stateno = 242)

;Standing Strong Punch3 Duplicate
[State -1, Stand Strong Punch 232]
type = ChangeState
value = 232
triggerall = command = "b"
triggerall = command != "holddown"
;trigger1 = statetype = S
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 222 || Stateno = 422)

;----------------------------------
;Crouch Strong Punch3 Duplicate
[State -1, Crouch Strong Punch 432]
type = ChangeState
value = 432
triggerall = command = "b"
triggerall = command = "holddown"
;trigger1 = statetype = C
triggerall = var(1) ;Use combo condition (above)
trigger1 = (stateno = 422 || Stateno = 222)

;Stand Light Punch3 Duplicate
[State -1, Standing Light Punch3 242]
type = ChangeState
value = 242
triggerall = command = "y"
triggerall = command != "holddown"
;triggerall = statetype = S
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 232 || Stateno = 432)


;Crouch Light Punch3
[State -1, Crouch Light Punch3 442]
type = ChangeState
value = 442
triggerall = command = "y"
triggerall = command = "holddown"
;triggerall = statetype = C
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 232 || Stateno = 432)

;-------------------------------------------------------------------
;Stand Light Punch3
[State -1, Standing Light Punch3 252]
type = ChangeState
value = 252
triggerall = command = "y"
triggerall = command != "holddown"
;triggerall = statetype = S
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 236 || Stateno = 436)

;----------------------------------
;Crouch Light Punch3
[State -1, Crouch Light Punch3 452]
type = ChangeState
value = 452
triggerall = command = "y"
triggerall = command = "holddown"
;triggerall = statetype = C
triggerall = var(1) ;Use combo condition (above)
trigger1 = (Stateno = 436 || Stateno = 236)

