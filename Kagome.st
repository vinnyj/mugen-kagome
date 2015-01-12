;Variables
;var(0) = the simplifier variable, optional but helpful.
;var(1) = Combo Condition Check used in Kagome.cmd
;var(2) = HoldFwd? Var
;var(3) = Intro/Win/Sit voice Picker
;var(5) = Detect Partner Death for specific sound in Simul Mode
;var(56) - used by the XOR-ed commands method to detect recent custom states.
;var(57) - the GameTime variable, required by the helper and XOR methods.
;var(58) - the primary AI variable.

;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------
; RUN_BACK
[Statedef 105]
type    = A
physics = N
ctrl = 0
anim = 105
sprpriority = 1

[State 105, 1]
type = VelSet
trigger1 = AnimElem = 5
x = const(velocity.run.back.x)
y = const(velocity.run.back.y)

[State 105, 2]
type = MakeDust
trigger1 = AnimElem = 5
pos = 0,0
spacing = 1

[State 105, Walk]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 105, 3]
type = VelAdd
trigger1 = AnimElem = 8
y = 4

[State 105, 4]
type = ChangeState
trigger1 = AnimElemTime(9) = 3
value = 106

;---------------------------------------------------------------------------
; RUN_BACK2 (land)
[Statedef 106]
type    = S
physics = S
ctrl = 0
anim = 106

[State 106, Walk]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 106, 1]
type = VelSet
trigger1 = Time = 0
y = 0

[State 106, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 106, 3]
type = ChangeState
trigger1 = Time = 15
value = 0
ctrl = 1

;RUN_FWD (overridden to dash-type)
[Statedef 100]
type = A
physics = N
anim = 100
ctrl = 0
sprpriority = 1

[State 100, 1]
type = VelSet
trigger1 = AnimElem = 4
x = const(velocity.run.fwd.x)
y = const(velocity.run.fwd.y)

[State 100, 2]
type = MakeDust
trigger1 = AnimElem = 4
pos = 0,0
spacing = 1

[State 100, 3]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 100, 5]
type = veladd
trigger1 = AnimElem = 8
y = 4.0

[State 100, 6]
type = ChangeState
trigger1 = AnimElemTime(9) = 3
Value = 101

;---------------------------------------------
;RUN_FWD2 
[Statedef 101]
type = S
physics = S
ctrl = 0
anim = 101

[State 101, 2]
type = PosSet
trigger1 = Time = 0
y = 0

[State 101, 3]
type = AssertSpecial
trigger1 = 1
flag = NoWalk

[State 101, 4]
type = Velset
trigger1 = Time = 0
y = 0

[State 101, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
; Lose by Time Over
[Statedef 170]
type = S
ctrl = 0
anim = 170
velset = 0,0

[State 170, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 170, 1]
type = PlaySnd
trigger1 = AnimElem = 4 && DrawGame
value = 1, 0

[State 170, 2]
type = PlaySnd
trigger1 = AnimElem = 14 && DrawGame
value = 1, 1

[State 170, Lost]
type = PlaySnd
trigger1 = AnimElem = 14 && LoseTime
value = 5500, 0

[State 170, 3]
type = AssertSpecial
trigger1 = Time = [0,200]
flag = Roundnotover

;---------------------------------------------------------------------------
; Win state decider
; CNS difficulty: basic
; CNS ƒŒƒxƒ‹: Šî–{
[Statedef 180]
type = S

[State 180, Congrats]
type = ChangeState
trigger1 = Time = 0 && !Win
value = 182

[State 180, 1]
type = ChangeState
trigger1 = Win && MatchOver = 0
value = 181

[State 180, 2]
type = ChangeState
trigger1 =  Time = 0 && MatchOver = 1
value = 182

;---------------------------------------------------------------------------
; Win pose 1 
; CNS difficulty: basic
[Statedef 181]
type = S
ctrl = 0
anim = 181
velset = 0,0

[State 181, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 181, 2]
type = playsnd
trigger1 = AnimElem = 29 && var(3) = 1
value = 191, 1


[State 181, 2]
type = playsnd
trigger1 = AnimElem = 13 && var(3) = 2
value = 192, 1

[State 181, 3]
type = AssertSpecial
trigger1 = Time = [0,250]
flag = Roundnotover

;-------------------------------------
;Win Pose 2

[Statedef 182]
type = S
ctrl = 0
anim = 182
velset = 0,0

[State 182, 1]
type = NotHitBy
trigger1 = 1
value = SCA
time = 1

[State 182, 2]
type = playsnd
triggerall = life >= 400
trigger1 = AnimElem = 1
value = 191, 2

[State 182, 3]
type = playsnd
triggerall = life <= 399
trigger1 = AnimElem = 1
value = 191, 3

[State 182, 4]
type = AssertSpecial
trigger1 = Time = [0,250]
flag = Roundnotover

;---------------------------------------------------------------------------
; Introduction
[Statedef 191]
type = S
ctrl = 0
anim = 190
velset = 0,0

[State 190, 1] ;Freeze animation until PreIntro is over
type = ChangeAnim
trigger1 = RoundState = 0 && p2Name != "Lady_Kikyo"
value = 190

[State 190, Kikyo2]
type = ChangeAnim
trigger1 = RoundState = 0 && p2Name = "Lady_Kikyo"
value = 191

[State 190, Teleport]
type = PlaySnd
triggerall = PalNo = 9
trigger1 = AnimElem = 5 && Time > 5
value = 191, 4

[State 190, assert] ;Assert this until you want "round 1, fight" to begin
type = AssertSpecial
trigger1 = 1
flag = Intro

[State 190, FadeIn]
type = Trans
triggerall = PalNo = 9
trigger1 = 1
trans = addalpha
alpha = time, 256-time

[State 190, 2]
type = PlaySnd
triggerall = PalNo != 9
triggerall = p2Name != "Lady_Kikyo"
triggerall = var(3) = 1
trigger1 = AnimElem = 2
value = 191, 0
channel = 1

[State 190, 3]
type = PlaySnd
triggerall = PalNo != 9
triggerall = p2Name != "Lady_Kikyo"
triggerall = var(3) = 2
trigger1 = AnimElem = 2
value = 190, 0
channel = 1

[State 190, Kikyo]
type = PlaySnd
triggerall = p2Name = "Lady_Kikyo"
triggerall = PalNo != 9
trigger1 = AnimElem = 2
value = 191, 5
channel = 1

[State 190, 4] ;Change to stand state when done
type = ChangeState
trigger1 = AnimTime = 0
value = 0

;---------------------------------------------------------------------------
; Stand Light Punch
[Statedef 200]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 200, 1]
type = HitDef
trigger1 = Animelem = 5
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 28, 0                   ;Damage that move inflicts, guard damage
animtype = Light                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -70               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S5, 0                  ;Sound to play on hit
guardsound = S6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 3             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = 0             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.fall = 1
getpower = 14,0
givepower = 14,42
fall.recover = 0

[State 200, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 0
channel = 1

[State 200, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------
;Stand Light Punch2
[Statedef 201]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 2,0;6,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 200                       ;Change animation (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 201, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 201, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 0
channel = 1

[State 201, 3]
type = HitDef
trigger1 = Animelem = 5
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 14, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 8, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -10, -70               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S5, 0                  ;Sound to play on hit
guardsound = S6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -6             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.fall = 1
getpower = 14,0
givepower = 28,0
fall.recover = 0


[State 201, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------
;Stand Light Punch3
[Statedef 202]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 6,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 202                       ;Change animation (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 202, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 202, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 202, 3]
type = HitDef
trigger1 = Animelem = 7
attr = S, NA                     ;Attribute: Standing, Normal Attack
damage = 42, 0                   ;Damage that move inflicts, guard damage
animtype = Medium                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 4, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 10, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = -19, -60               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S5, 2                  ;Sound to play on hit
guardsound = S6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -6             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -1.4,-3           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.fall = 1
getpower = 14,0
givepower = 28,0
fall.recover = 0
ID = 202


[State 202, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------
;Mystic Ball
[Statedef 203]
type    = S                      ;State-type: S-stand, C-crouch, A-air, L-liedown
movetype= A                      ;Move-type: A-attack, I-idle, H-gethit
physics = S                      ;Physics: S-stand, C-crouch, A-air
juggle  = 1                      ;Number of air juggle points move takes
;Commonly-used controllers:
velset = 0,0                     ;Set velocity (x,y) (Def: no change)
ctrl = 0                         ;Set ctrl (Def: no change)
anim = 203                       ;Change animation (Def: no change)
poweradd = 0                    ;Power to add (Def: 0)
sprpriority = 2                  ;Set p1's sprite layering priority to 2 (in front)

[State 203, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 203, 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 200, 2
channel = 1

[State 203, 3]
type = Width
trigger1 = (AnimElemTime (7) >= 0) && (AnimElemTime (23) < 0)
value = 25,0

[State 203, 5]
type = Null
trigger1 = AnimElem = 7
anim = 3000
ID = 3000
pos = 34,-58
postype = p1
facing = 1
removetime = -2
ontop = 1
ownpal = 1
removeongethit = 1

[State 203, 6]
type = Projectile
trigger1 = Animelem = 7
attr = S, SP                     ;Attribute: Standing, Special Projectile
damage = 112,0                   ;Damage that move inflicts, guard damage
animtype = Heavy                 ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 10, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = 23, 0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S5, 2                  ;Sound to play on hit
guardsound = S6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -4             ;Velocity at which opponent is pushed
airguard.velocity = -1.9,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -3,-6           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.fall = 1
getpower = 112,0
givepower = 140,0
projanim = 3000
projID = 3001
projremanim = 3001
projremove = 0
projremovetime = 34
projpriority = 31
projsprpriority = 3
offset = 34,-58
postype = p1
fall = 1
fall.recover = 0
ID = 203


[State 203, Mystic]
type = PlaySnd
trigger1 = AnimElem = 7 && NumProjID(3001) = 1 ;NumExplod(3000) = 1
value = 3000, 1
channel = 2

[State 203, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Crouching light punch

[Statedef 400]
type    = C
movetype= A
physics = C
juggle  = 5
poweradd= 0
ctrl = 0
anim = 400
sprpriority = 2


[State 400, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 0
channel = 1

[State 401, 2]
type = HitDef
trigger1 = AnimElem = 5
attr = C, NA
damage    = 28,0
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = L
pausetime = 10,11
sparkno = 0
sparkxy = -10,-42
hitsound   = S5,0
guardsound = S6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 15
ground.velocity = -2
air.velocity = -1.5,-3
getpower = 14,0
givepower = 14,42

[State 400, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Crouching light punch 2

[Statedef 401]
type    = C
movetype= A
physics = C
juggle  = 5
poweradd= 0
ctrl = 0
anim = 400
velset = 0,0 ;6,0
sprpriority = 2

[State 401, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 401, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 0
channel = 1

[State 401, 3]
type = HitDef
trigger1 = AnimElem = 5
attr = C, NA
damage    = 14,0
priority  = 3
animtype  = Light
hitflag = MAF
guardflag = L
pausetime = 10,11
sparkno = 0
sparkxy = -10,-42
hitsound   = S5,0
guardsound = S6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 15
ground.velocity = -6
air.velocity = -1.5,-3
getpower = 14,0
givepower = 28,0


[State 401, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Crouching light punch 3

[Statedef 402]
type    = C
movetype= A
physics = C
juggle  = 5
poweradd= 0
ctrl = 0
anim = 401
velset = 6,0
sprpriority = 2

[State 402, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 402, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 402, 3]
type = HitDef
trigger1 = AnimElem = 7
attr = C, NA
damage    = 14,0
priority  = 3
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 10,11
sparkno = 0
sparkxy = -10,-42
hitsound   = S5,2
guardsound = S6,0
ground.type = Low
ground.slidetime = 4
ground.hittime  = 15
ground.velocity = -6
air.velocity = -1.5,-3
getpower = 14,0
givepower = 28,0


[State 402, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Jump Light Punch
; CNS difficulty: easy
[Statedef 600]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= 0
ctrl = 0
anim = 600
sprpriority = 2

[State 600, 1]
type = PlaySnd
trigger1 = AnimElem = 1
value = 200, 0

[State 600, 2]
type = HitDef
trigger1 = AnimElem = 5
attr = A, NA
damage    = 28,0
guardflag = HA
priority = 3
pausetime = 7,8
sparkno = 0
sparkxy = -20,-80
hitsound   = S5,0
guardsound = S6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 10
ground.velocity = -4
air.velocity = -1.3,-3
air.fall = 1
fall.recover = 0
getpower = 14,0
givepower = 14,42

;---------------------------------------------------------------------------
; Standing strong punch
; CNS difficulty: easy

[Statedef 210]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,0
anim = 210
sprpriority = 2

[State 210, 1]
type = Width
trigger1 = (AnimElemTime (4) >= 0) && (AnimElemTime (10) < 0)
value = 25,0

[State 210, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
animtype  = Medium
damage    = 42,0
guardflag = MA
pausetime = 12,12
sparkno = 1
sparkxy = -10,-70
hitsound   = S5,2
guardsound = S6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 13
ground.velocity = -3
air.velocity = -2.5,-4
air.fall = 1
fall.recover = 0
getpower = 42,0
givepower = 42,42


[State 210, 3]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 5
channel = 1

[State 210, Bow]
type = PlaySnd
trigger1 = AnimElem = 3
value = 200, 4

[State 210, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------
;Standing Strong Punch 2

[Statedef 211]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,0
anim = 210
sprpriority = 2

[State 211, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 211, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 3
channel = 1

[State 211, 3]
type = Width
trigger1 = (AnimElemTime (4) >= 0) && (AnimElemTime (10) < 0)
value = 25,0

[State 211, Bow]
type = PlaySnd
trigger1 = AnimElem = 3
value = 200, 4

[State 211, 4]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
animtype  = Medium
damage    = 28,0
guardflag = MA
pausetime = 12,12
sparkno = 1
sparkxy = -10,-70
hitsound   = S5,2
guardsound = S6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 13
ground.velocity = -4
air.velocity = -2.5,-4
air.fall = 1
fall.recover = 0
getpower = 42,0
givepower = 12,0


[State 211, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------
;Standing Strong Punch 3

[Statedef 212]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 6,0
anim = 211
sprpriority = 2

[State 212, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 212, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 212, 3]
type = Width
trigger1 = (AnimElemTime (4) >= 0) && (AnimElemTime (10) < 0)
value = 25,0

[State 212, 4]
type = HitDef
trigger1 = AnimElem = 4
attr = S, NA
animtype  = Medium
damage    = 14,0
guardflag = MA
pausetime = 12,12
sparkno = 1
sparkxy = -10,-70
hitsound   = S5,2
guardsound = S6,0
ground.type = High
ground.slidetime = 12
ground.hittime  = 13
ground.velocity = -5
air.velocity = -2.5,-4
air.fall = 1
fall.recover = 0
getpower = 14,0
givepower = 28,0
ID = 212


[State 212, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Crouching strong punch

[Statedef 410]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 410
sprpriority = 2

[State 410, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 5

[State 410, Bow]
type = PlaySnd
trigger1 = AnimElem = 3
value = 200, 4

[State 410, 2]
type = HitDef
trigger1 = AnimElem = 4
attr = C, NA
damage    = 42,0
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 12,12
sparkno = 1
sparkxy = -10,-55
hitsound   = S5,2
guardsound = S6,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4
air.velocity = -3,-4
getpower = 28,0
givepower = 28,42


[State 410, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching strong punch2

[Statedef 411]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 410
velset = 0,0;4,0
sprpriority = 2

[State 411, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 411, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 3

[State 411, Bow]
type = PlaySnd
trigger1 = AnimElem = 3
value = 200, 4

[State 411, 3]
type = HitDef
trigger1 = AnimElem = 4
attr = C, NA
damage    = 28,0
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 12,12
sparkno = 1
sparkxy = -10,-55
hitsound   = S5,2
guardsound = S6,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4
air.velocity = -3,-4
getpower = 28,0
givepower = 28,28


[State 411, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching strong punch3

[Statedef 412]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 411
velset = 6,0
sprpriority = 2

[State 412, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 412, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1

[State 412, 3]
type = HitDef
trigger1 = AnimElem = 7
attr = C, NA
damage    = 14,0
animtype  = Medium
hitflag = MAF
guardflag = L
pausetime = 12,12
sparkno = 1
sparkxy = -12,-42
hitsound   = S5,2
guardsound = S6,0
ground.type = Low
ground.slidetime = 12
ground.hittime  = 15
ground.velocity = -4
air.velocity = -3,-4
getpower = 14,0
givepower = 14,28


[State 412, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Jump Strong Punch
; CNS difficulty: easy
[Statedef 610]
type    = A
movetype= A
physics = A
juggle  = 4
poweradd= 0
ctrl = 0
anim = 610
sprpriority = 2

[State 610, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 5
channel = 1

[State 610, Bow]
type = PlaySnd
trigger1 = AnimElem = 4
value = 200, 4

[State 610, 3]
type = HitDef
trigger1 = AnimElem = 5
attr = A, NA
damage = 42,0
guardflag = HA
priority = 4
pausetime = 12,12
sparkno = 1
sparkxy = -10,-55
hitsound   = S5,2
guardsound = S6,0
animtype = Med
ground.type = High
ground.slidetime = 17
ground.hittime  = 17
ground.velocity = -5
air.velocity = -3,-4
air.fall = 1
fall.recover = 0
getpower = 28,0
givepower = 28,28

;Dashing Forward Punch
; CNS difficulty: easy
[Statedef 620]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= 0
velset = 2,0
ctrl = 0
anim = 620
sprpriority = 2

[State 620, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 5

[State 620, Bow]
type = PlaySnd
trigger1 = AnimElem = 5
value = 200, 4

[State 620, 2]
type = HitDef
trigger1 = AnimElem = 6
attr = A, NA
damage    = 42,0
guardflag = HA
priority = 3
pausetime = 7,8
sparkno = 0
sparkxy = -20,-80
hitsound   = S5,2
guardsound = S6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 10
ground.velocity = -4
air.velocity = -1.3,-3
air.fall = 1
fall.recover = 0
getpower = 28,0
givepower = 28,14

[State 620, Pos]
type = PosSet
trigger1 = AnimTime < 31
y = -2

[State 620, freeze]
type = Velset
trigger1 = Pos Y = -2
y = -2.5

[State 620, Blah]
type = PosSet
trigger1 = AnimTime >= 26
y = 0

[State 620, 7]
type = ChangeState
trigger1 = AnimTime >= 31
value = 0
ctrl = 1

;Dashing Backward Punch
; CNS difficulty: easy
[Statedef 621]
type    = A
movetype= A
physics = A
juggle  = 2
poweradd= 0
velset = -2,0
ctrl = 0
anim = 621
sprpriority = 2

[State 621, 1]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 5

[State 621, Bow]
type = PlaySnd
trigger1 = AnimElem = 5
value = 200, 4

[State 621, 2]
type = HitDef
trigger1 = AnimElem = 6
attr = A, NA
damage    = 42,0
guardflag = HA
priority = 3
pausetime = 7,8
sparkno = 0
sparkxy = -20,-80
hitsound   = S5,2
guardsound = S6,0
ground.type = High
ground.slidetime = 5
ground.hittime  = 10
ground.velocity = -4
air.velocity = -1.3,-3
air.fall = 1
fall.recover = 0
getpower = 28,0
givepower = 28,14

[State 621, Pos]
type = PosSet
trigger1 = AnimTime < 31
y = -2

[State 621, freeze]
type = Velset
trigger1 = Pos Y = -2
y = -2.5

[State 621, Blah]
type = PosSet
trigger1 = AnimTime >= 26
y = 0

[State 621, 7]
type = ChangeState
trigger1 = AnimTime >= 31
value = 0
ctrl = 1

;--------------------------------------
[Statedef 1000]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
velset = 0,0
anim = 1000
ctrl = 0
sprpriority = 1

[State 1000, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 1000, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 4
channel = 1

[State 1000, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 1001

;--------------------------------------
[Statedef 1001]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
velset = 0,0
anim = 1001
ctrl = 0
sprpriority = 1

[State 1001, Arrow Sound]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 7

[State 203, 6]
type = Projectile
trigger1 = Animelem = 1
attr = S, SP                     ;Attribute: Standing, Special Projectile
damage = 126,42                   ;Damage that move inflicts, guard damage
animtype = Heavy                ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 10, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = 23, 0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S5, 4                  ;Sound to play on hit
guardsound = S6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -4, -2             ;Velocity at which opponent is pushed
guard.velocity = -3
airguard.velocity = -3,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -5,-6           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.fall = 1
getpower = 126,0
givepower = 126,42
projanim = 1003
projID = 1003
;projremanim = 1004
projremove = 1
;projremovetime = 0
projpriority = 31
projsprpriority = 2
offset = 2,-70
postype = p1
fall = 1
fall.recover = 0
ID = 1003
velocity = 4.5,0

[State 1001, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 1002

;--------------------------------------
[Statedef 1002]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
velset = 0,0
anim = 1002
ctrl = 0
sprpriority = 1

[State 1002, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;--------------------------------------
;Kagome Explosion
[Statedef 1500]
type = S
movetype = A
physics = S
juggle = 4
poweradd = 0
velset = 0,0
anim = 1500
ctrl = 0
sprpriority = 2

[State 1500, 1]
type = PlaySnd
trigger1 = Animelem = 2
value = 1000, 1
channel = 1

[State 1500, 2]
type = PlaySnd
trigger1 = AnimElem = 10
value = 1500, 0

[State 1500, 6]
type = Projectile
trigger1 = Animelem = 10
attr = S, SP                     ;Attribute: Standing, Special Projectile
damage = 140,42                   ;Damage that move inflicts, guard damage
animtype = Medium                ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAF                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 10, 8                 ;Time attacker pauses, time opponent shakes
sparkno = -1                      ;Spark anim no (Def: set above)
sparkxy = 100, 150               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S5, 2                  ;Sound to play on hit
guardsound = S6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -6             ;Velocity at which opponent is pushed
guard.velocity = -3
airguard.velocity = -3,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -6,-6           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.fall = 1
getpower = 154,0
givepower = 154,42
projanim = 1502
projID = 1502
;projremanim = 1004
projremove = 0
projremovetime = 28
projpriority = 31
projsprpriority = 0
projedgebound = 200
projstagebound = 100
offset = -81,-213
postype = p1
fall = 1
fall.recover = 0
ID = 1502
velocity = 0,0

[State 1500, energy]
type = Explod
trigger1 = AnimElem = 10
anim = 1501
sprpriority = 0
bindtime = -1
removetime = 28
ownpal = 1
pos = -81, -213

[State 1500, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------------------------
;Sit Boy!
[Statedef 517]
type     = S
movetype = A
physics  = S
juggle   = 0
velset   = 0,0
ctrl = 0
anim = 517
sprpriority = 2

[State 517, 1]
type = HitDef
triggerall = enemy, Name = "Inuyasha by VinceJ" 
Trigger1 = AnimElem = 1
Trigger2 = AnimElem = 2 && !MoveContact
Trigger3 = AnimElem = 3 && !MoveContact
Trigger4 = AnimElem = 4 && !MoveContact
Trigger5 = AnimElem = 5 && !MoveContact
attr = S, NT
hitflag = M-
priority = 6, Dodge
sparkno = -1
p1sprpriority = 1
p1facing = 1
p2facing = 1
p1stateno = 518
p2stateno = 519
guard.dist = 0
fall = 1

[State 517, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Kagome Stomping Ground, "SIT BOY!"
[Statedef 518]
type    = S
movetype= A
physics = N
anim = 517
poweradd = 56

[State 518, Holding fwd?]
type = VarSet
trigger1 = Time = 0
var(2) = command = "holdfwd"

[State 518, 1]
type = Width
trigger1 = 1
value = 25,0

[State 518, Snd1]
type = PlaySnd
triggerall = AnimElem = 2 
trigger1 = var(3) = 1
value = 517, 0
channel = 1

[State 518, Snd2]
type = PlaySnd
triggerall = AnimElem = 1 
trigger1 = var(3) = 2
value = 517, 1
channel = 1

[State 518, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------------------
; Custom State for Inuyasha, Falling Face-flat
[Statedef 519]
type = S
movetype = H
physics = N
sprpriority = 0
velset = 0,0
ctrl = 0
anim = 516

[State 519, Collar Sound]
type = PlaySnd
trigger1 = (anim = 516 && AnimElem = 1)
value = 517, 2

[State 519, Sit Sound]
type = PlaySnd
trigger1 = (anim = 516 && AnimElem = 8)
value = 517, 3

[State 519, Shake Screen]
type = EnvShake
trigger1 = (anim = 516 && AnimElem = 8)
persistent = 0
time = 10           ;Parameters for shaking the screen on hit
ampl = -7
freq = 90
phase = 1

[State 519, Hurt]
type = LifeAdd
trigger1 = (anim = 516 && AnimElem = 8)
value = -56

[State 519, Power]
type = PowerAdd
trigger1 = (anim = 516 && AnimElem = 8)
value = 56

[State 519, 1]
type = ChangeAnim2
trigger1 = (anim = 516 && AnimTime = 0)
value = 518

[State 519, 2]
type = ChangeAnim
trigger1 = SelfAnimExist(5150) && !Alive && Anim != 5150
value = 5150

[State 519, 3]
type = SelfState
trigger1 = !Alive
value = 5150

[State 519, 4]
type = SelfState
trigger1 = AnimTime = 0;Time = (const(data.liedown.time) + 10)
value = 5121

;----------------------------------------------------
;Backpack Thrash
[Statedef 800]
type    = S
movetype= A
physics = S
juggle  = 0
velset = 0,0
ctrl = 0
anim = 800
sprpriority = 2

[State 800, 1]
type = HitDef
Trigger1 = Time = 0
attr = S, NT          ;Attributes: Standing, Normal Throw
hitflag = M-          ;Affect only ground people who are not being hit
priority = 5, Miss    ;Throw has priority, must be miss or dodge type.
sparkno = -1          ;No spark
p1sprpriority = 1     ;Draw p1's sprite in front of p2
                      ;p2's sprite priority is set to 0 by default
p1facing = 1
p2facing = 1          ;Force p2 to face Kagome
p1stateno = 810       ;On success, KFM changes to state 810
p2stateno = 820       ;If hit, p2 changes to state 820 in KFM's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down

[State 800, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Backpack Thrash
[Statedef 810]
type    = S
movetype= A
physics = N
anim = 810
poweradd = 56

[State 810, Holding fwd?]
type = VarSet
trigger1 = Time = 0
var(2) = command = "holdfwd"


[State 810, Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 8;3
value = 200, 1
channel = 1

[State 810, Hard]
type = PlaySnd
trigger1 = AnimElem = 10;5
value = S5, 2

[State 1027, Spark]
type = Explod
trigger1 = AnimElem = 10;5
anim = F0
pos = 20,-80
postype = p1
sprpriority = 3

[State 810, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(13) <= 0 ;AnimElemTime(8) <= 0
pos = 14, 0

[State 810, Width 2]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(12) <= 0 ;AnimElemTime(7) <= 0
edge = 30,0

[State 810, Hurt 11]
type = TargetLifeAdd
trigger1 = AnimElem = 12;7
value = -70

[State 810, Power]
type = TargetPowerAdd
trigger1 = AnimElem = 12;7
value = 84

[State 810, Shake Screen]
type = EnvShake
trigger1 = AnimElem = 12;7
time = 8     ;Time to shake screen
ampl = 4     ;Amount to shake
freq = 180   ;A frequency of 180 shakes the screen rapidly

[State 810, Throw 11]
type = TargetState
trigger1 = AnimElem = 15 ;10
value = 821

[State 810, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Hit by Backpack thrash
[Statedef 820]
type    = A
movetype= H
physics = N
velset = 0,0

[State 820, 1]
type = ChangeAnim2
Trigger1 = Time = 0
value = 820

[State 820, 2]
type = SelfState
trigger1 = !gethitvar(isbound)
value = 5050

;---------------------------------------------------------------------------
;Hit across screen by Backpack
[Statedef 821]
type    = A
movetype= H
physics = N
velset = -13,-0.3
poweradd = 40

[State 821, No scroll]
type = ScreenBound
trigger1 = BackEdgeBodyDist < 65
trigger2 = FrontEdgeBodyDist < 65
value = 1
movecamera = 0,0

[State 821, 1] ;Gravity
type = VelAdd
Trigger1 = BackEdgeBodyDist <= 40
y = 0.6

[State 821, 2] ; Recover near ground (use ChangeState)
type = ChangeState
triggerall = Vel Y > 0
triggerall = Pos Y >= -20
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5200 ;HITFALL_RECOVER

[State 821, 3] ; Recover in mid air (use SelfState)
type = SelfState
triggerall = Vel Y > 0
triggerall = alive
triggerall = CanRecover
trigger1 = Command = "recovery"
value = 5210 ;HITFALL_AIRRECOVER

[State 821, 4] ;Hit ground
type = SelfState
trigger1 = Vel Y > 0
trigger1 = Pos Y >= 0
value = 5100 ;Hit ground

;----------------------------------------
;Air Throw
[Statedef 850]
type    = A
movetype= A
physics = A
juggle  = 10
velset = 0,0
ctrl = 0
anim = 849
sprpriority = 1

[State 850, 1]
type = HitDef
trigger1 = AnimElem = 1
attr = A, NT          ;Attributes: Standing, Normal Throw
hitflag = A          ;Affect only ground people who are not being hit
priority = 5, Miss   ;Throw has priority, must be miss or dodge type.
sparkno = -1          ;No spark
p1sprpriority = 1     ;Draw p1's sprite in front of p2
                      ;p2's sprite priority is set to 0 by default
p1facing = 1
p2facing = 1          ;Force p2 to face Kagome
p1stateno = 851       ;On success, Kagome changes to state 851
p2stateno = 820       ;If hit, p2 changes to state 820 in Kagome's cns
guard.dist = 0        ;This prevents p2 from going into a guard state if close
fall = 1              ;Force p2 into falling down
yaccel = .5

[State 850, 2]
type = ChangeState
Trigger1 = AnimTime = 0
value = 50
ctrl = 1

;--------------------------------------
;Air Throw 2
[Statedef 851]
type    = A
movetype= A
physics = N
anim = 850
poweradd = 56

[State 850, Holding fwd?]
type = VarSet
trigger1 = Time = 0
var(2) = command = "holdfwd"

[State 850, Throw Sound]
type = PlaySnd
trigger1 = AnimElem = 3
value = 200, 1
channel = 1

[State 850, Hard]
type = PlaySnd
trigger1 = AnimElem = 5
value = S5, 2

[State 850, Spark]
type = Explod
trigger1 = AnimElem = 5
anim = F0
pos = 20,-80
postype = p1
sprpriority = 3

[State 850, Bind 1]
type = TargetBind
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(7) <= 0
pos = 14, 0

[State 850, Width 2]
type = Width
trigger1 = AnimElemTime(1) >= 0 && AnimElemTime(6) <= 0
edge = 30,0

[State 850, Hurt 11]
type = TargetLifeAdd
trigger1 = AnimElem = 7
value = -70

[State 850, Power]
type = TargetPowerAdd
trigger1 = AnimElem = 7
value = 56

[State 850, Shake Screen]
type = EnvShake
trigger1 = AnimElem = 7
time = 8     ;Time to shake screen
ampl = 4     ;Amount to shake
freq = 180   ;A frequency of 180 shakes the screen rapidly

[State 850, 5]
type = PosFreeze
trigger1 = AnimElemTime(18) <= 0

[State 850, 6]
type = StateTypeSet
trigger1 = AnimElemTime(18) >= 0
physics = A

[State 850, Throw 11]
type = TargetState
trigger1 = AnimElem = 10
value = 821

[State 850, State End]
type = ChangeState
trigger1 = AnimTime = 0
value = 50
ctrl = 1

;--------------------------------------
[Statedef 2000]
type    = S
movetype= A
physics = S
juggle  = 4
velset = 0,0
anim = 2000
ctrl = 0
sprpriority = 1

[State 2000, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 2000, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 1000, 2
channel = 1

[State 2000, Hit the Mark]
type = PlaySnd
trigger1 = AnimElem = 18
value = 1000, 0
channel = 1

;Super Pause
[State 2000, SPause]
type = SuperPause
trigger1 = AnimElem = 17
time = 60
pos = 30,-70
darken = 0
poweradd = -1000

;Kagome Animation
[State 2000, KGM]
type = Explod
trigger1 = AnimElem = 2
anim = 4000
postype = back
pos = 0,0
facing = 1
supermovetime = 174
sprpriority = -3
ownpal = 1
bindtime = -1
removeongethit = 1

[State 2000, Arrow Sound]
type = PlaySnd
trigger1 = AnimElem = 20
value = 1000, 5

[State 2000, Arrow]
type = Explod
trigger1 = AnimElem = 20
anim = 1003
pos = -12, -70
postype = p1
ID = 1111
ownpal = 1
removeongethit = 0
sprpriority = 2
vel = 5.5,0
removetime = -1
;ignorehitpause = 1

[State 2000, 6]
type = Projectile
trigger1 = Animelem = 20
attr = S, HP                     ;Attribute: Standing, Hyper Projectile
damage = 308,84                   ;Damage that move inflicts, guard damage
animtype = Heavy                ;Animation type: Light, Medium, Heavy, Back (def: Light)
guardflag = MA                   ;Flags on how move is to be guarded against
hitflag = MAFP                    ;Flags of conditions that move can hit
priority = 5, Hit                ;Attack priority: 0 (least) to 7 (most), 4 default
;Hit/Miss/Dodge type (Def: Hit)
pausetime = 0, 8                 ;Time attacker pauses, time opponent shakes
sparkno = 0                      ;Spark anim no (Def: set above)
sparkxy = 23, 0               ;X-offset for the "hit spark" rel. to p2,
;Y-offset for the spark rel. to p1
hitsound = S3000,0 ;5, 4                  ;Sound to play on hit
guardsound = S6, 0                ;Sound to play on guard
ground.type = High               ;Type: High, Low, Trip (def: Normal)
ground.slidetime = 5             ;Time that the opponent slides back
ground.hittime  = 15             ;Time opponent is in hit state
ground.velocity = -4, -2             ;Velocity at which opponent is pushed
guard.velocity = -4
airguard.velocity = -4,-.8     ;Guard velocity in air (def: (air.xvel*1.5, air.yvel/2))
air.type = High                  ;Type: High, Low, Trip (def: same as ground.type)
air.velocity = -5,-6           ;X-velocity at which opponent is pushed,
;Y-velocity at which opponent is pushed
air.hittime = 12                 ;Time before opponent regains control in air
air.fall = 1
getpower = 0,0
givepower = 336,42
projanim = 2001
projID = 2001
;projremanim = 1004
projremove = 0
;projremovetime = 0
projpriority = 31
projsprpriority = 3
offset = 22,-70
postype = p1
fall = 1
fall.recover = 0
ID = 2001
velocity = 5.5,0
projscale = 0.75,0.5
;ignorehitpause = 1
projhits = 1
projmisstime = 20

[State 2000, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;==========================================

; (Credit to ANMC, Bagaliao, and FlowaGirl for the basic helper method concept.)
;
;------------------
; AI Activation Helper State - Primary Version
; (Credit to YongMing for the basic HitPause bugfix concept.)
;
; var(1) - First tick button activation prevention.
; var(2) - Used for pause/superpause and custom state check, basically.
; var(3) - (Super/)Pause & custom state-triggered dir detection disabler.
; var(4) - Persistent direction command detection enabler (due to 2002.04.14).
; var(9) - AutoTurn bug fixer.
; var(10)- Post-custom state buffered dir detection disabler.
; parent's var(57) - Parent's GameTime var, for pause and custom state check.
; parent's var(58) - Parent's primary AI variable.
;
; The code in this state is mostly simply copy/pasteable.
; But if you're using different indices for the parent's variables,
; or if you change your character's basic commands' names, you'll
; of course need to change the code in this state accordingly.

[StateDef 9741]
type = S
movetype = I
physics = N
anim = 9741
ctrl = 0

[State 9741, Safety]; Just in case your opponent is very poorly coded.
type = SelfState
trigger1 = !IsHelper
value = 5050

[State 9741, UglyHack]
type = VarSet
trigger1 = !var(1)
var(2) = 2

[State 9741, PauseCheck]
type = VarSet
trigger1 = GameTime > Parent,var(57)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2
trigger4 = Parent,var(58)
trigger5 = var(3):=0
var(2) = (var(3):=1)+(var(4):=0)

[State 9741, Facing]
type = Turn
trigger1 = var(9):=(Facing != Parent,Facing)
trigger1 = !(var(4):=0)

[State 9741, DirTurnOnAI]
type = ParentVarSet
triggerall = !(var(3) || var(9))
trigger1 = Parent,command = "holdfwd"
trigger2 = Parent,command = "holdback"
trigger3 = Parent,command = "holdup"
trigger4 = Parent,command = "holddown"
trigger5 = !(var(4):=1)
var(58) = var(4)

[State 9741, DirTurnOffAI]
type = ParentVarSet
triggerall = !var(3)
triggerall = Parent,var(58)
trigger1 = command = "holdfwd"
trigger1 = Parent,command = "holdfwd"
trigger2 = command = "holdback"
trigger2 = Parent,command = "holdback"
trigger3 = command = "holdup"
trigger3 = Parent,command = "holdup"
trigger4 = command = "holddown"
trigger4 = Parent,command = "holddown"
var(58) = var(4):=0

[State 9741, ButtonTurnOnAI]
type = ParentVarSet
triggerall = !var(2)
trigger1 = Parent,command = "a"
trigger2 = Parent,command = "b"
trigger3 = Parent,command = "c"
trigger4 = Parent,command = "x"
trigger5 = Parent,command = "y"
trigger6 = Parent,command = "z"
trigger7 = Parent,command = "start"
var(58) = 1

[State 9741, ButtonTurnOffAI]
type = ParentVarSet
triggerall = !var(2)
trigger1 = command = "a"
trigger1 = Parent,command = "a"
trigger2 = command = "b"
trigger2 = Parent,command = "b"
trigger3 = command = "c"
trigger3 = Parent,command = "c"
trigger4 = command = "x"
trigger4 = Parent,command = "x"
trigger5 = command = "y"
trigger5 = Parent,command = "y"
trigger6 = command = "z"
trigger6 = Parent,command = "z"
trigger7 = command = "start"
trigger7 = Parent,command = "start"
var(58) = -1

[State 9741, UnPauseCheck]
type = VarSet
triggerall = var(2)
trigger1 = Parent,command = "a"
trigger2 = Parent,command = "b"
trigger3 = Parent,command = "c"
trigger4 = Parent,command = "x"
trigger5 = Parent,command = "y"
trigger6 = Parent,command = "z"
trigger7 = Parent,command = "start"
trigger8 = var(2) = 2
trigger8 = var(2):=0
var(2) = 2

[State 9741, Goodbye]
type = DestroySelf
triggerall = var(1):=1
trigger1 = Parent,var(58)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2

;[State 9741, DTC]
;type = DisplayToClipboard
;trigger1 = 1
;text = "Var(2) = %d, ParentVar(57) = %d, GameTime = %d, Var(3) = %d"
;params = var(2), (Parent,var(57)), GameTime, var(3)

;------------------
; AI Activation Helper State - Compatibly Partnered Version
;
; var(1) - First tick dir activation prevention
; var(2) - Used for pause/superpause and custom state check, basically.
; var(3) - (Super/)Pause & custom state-triggered dir detection disabler.
; var(4) - Hitpause check.
; var(5) - No button on previous tick.
; var(6) - Any dir on this tick.
; var(7) - Any button on this tick.
; var(8) - Matching partner button detected.
; var(9) - AutoTurn bug fixer.
; var(10)- Buffered dir detection disabler.
; parent's var(57) - Parent's GameTime var, for pause and custom state check.
; parent's var(58) - Parent's primary AI variable.
;
; The code in this state is mostly simply copy/pasteable.
; But if you're using different indices for the parent's variables,
; or if you change your character's basic commands' names, you'll
; of course need to change the code in this state accordingly.

[StateDef 9742]
type = S
movetype = I
physics = N
anim = 9741
ctrl = 0

[State 9742, Safety]; Just in case your opponent is very poorly coded.
type = SelfState
trigger1 = !IsHelper
value = 5050

[State 9742, UglyHack]
type = VarSet
trigger1 = !var(1)
var(2) = var(3):=2

[State 9742, PauseCheck]
type = VarSet
trigger1 = GameTime > Parent,var(57)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2
trigger4 = Parent,var(58)
trigger5 = var(3):=0
var(2) = var(3):=1

[State 9742, Facing]
type = Turn
trigger1 = var(9):=(Facing != Parent,Facing)

[State 9742, ParentDirCheck]
type = VarSet
trigger1 = Parent,command = "holdfwd"
trigger2 = Parent,command = "holdback"
trigger3 = Parent,command = "holdup"
trigger4 = Parent,command = "holddown"
trigger5 = var(6):=0
var(6) = 1

[State 9742, BufferCheck]
type = VarSet
trigger1 = var(3) || var(4) || var(10)
var(10) = var(6)

[State 9742, ParentButtonCheck]
type = VarSet
trigger1 = Parent,command = "a"
trigger2 = Parent,command = "b"
trigger3 = Parent,command = "c"
trigger4 = Parent,command = "x"
trigger5 = Parent,command = "y"
trigger6 = Parent,command = "z"
trigger7 = Parent,command = "start"
trigger8 = var(7):=0
var(7) = 1

[State 9742, SameButtonCheck]
type = VarSet
triggerall = var(7)
triggerall = !var(2)
triggerall = NumPartner
trigger1 = Parent,command = "a"
trigger1 = Partner,command = "a"
trigger2 = Parent,command = "b"
trigger2 = Partner,command = "b"
trigger3 = Parent,command = "c"
trigger3 = Partner,command = "c"
trigger4 = Parent,command = "x"
trigger4 = Partner,command = "x"
trigger5 = Parent,command = "y"
trigger5 = Partner,command = "y"
trigger6 = Parent,command = "z"
trigger6 = Partner,command = "z"
trigger7 = Parent,command = "start"
trigger7 = Partner,command = "start"
trigger8 = var(8):=0
var(8) = 1

[State 9742, DirTurnOnAI]
type = ParentVarSet
trigger1 = var(6)
trigger1 = !(var(9) || var(10))
var(58) = 1

[State 9742, DirTurnOffAI]
type = ParentVarSet
triggerall = var(6)
triggerall = !var(3)
triggerall = Parent,var(58)
trigger1 = command = "holdfwd"
trigger1 = Parent,command = "holdfwd"
trigger2 = command = "holdback"
trigger2 = Parent,command = "holdback"
trigger3 = command = "holdup"
trigger3 = Parent,command = "holdup"
trigger4 = command = "holddown"
trigger4 = Parent,command = "holddown"
var(58) = 0

[State 9742, ButtonTurnOnAI]
type = ParentVarSet
trigger1 = var(5) && var(7)
trigger1 = !(var(2) || var(8))
var(58) = 1

[State 9742, ButtonTurnOffAI]
type = ParentVarSet
triggerall = var(7)
triggerall = !(var(2) || var(8))
trigger1 = command = "a"
trigger1 = Parent,command = "a"
trigger2 = command = "b"
trigger2 = Parent,command = "b"
trigger3 = command = "c"
trigger3 = Parent,command = "c"
trigger4 = command = "x"
trigger4 = Parent,command = "x"
trigger5 = command = "y"
trigger5 = Parent,command = "y"
trigger6 = command = "z"
trigger6 = Parent,command = "z"
trigger7 = command = "start"
trigger7 = Parent,command = "start"
var(58) = -1

[State 9742, UnPauseCheck]
type = VarSet
triggerall = var(2)
triggerall = !var(4)
trigger1 = var(7)
trigger2 = var(2) = 2
trigger2 = var(2):=0
var(2) = 2

[State 9742, Goodbye]
type = DestroySelf
trigger1 = Parent,var(58)
trigger2 = !(Parent,Alive)
trigger3 = RoundState != 2

[State 9742, HitPauseCheck]
type = VarSet
trigger1 = var(6) || var(7)
trigger2 = !(Parent,HitPauseTime)
var(4) = Parent,HitPauseTime

[State 9742, Delay]
type = VarSet
trigger1 = var(1):=1
var(5) = !var(7)

;[State 9742, DTC]
;type = DisplayToClipboard
;trigger1 = 1
;text = "Var(2) = %d, ParentVar(57) = %d, GameTime = %d, Var(3) = %d"
;params = var(2), (Parent,var(57)), GameTime, var(3)

;---------------------------------------------------------------------------
; Override common states (use same number to override) :
;---------------------------------------------------------------------------

; Initialize (at the start of the round)
[Statedef 5900]
type = S

[State 5900, 1] ;Clear all int variables
type = VarRangeSet
trigger1 = !RoundsExisted
value = 0
persistent = 0

[State 5900, 2] ;Clear all float variables
type = VarRangeSet
trigger1 = !RoundsExisted
fvalue = 0
persistent = 0

[State 5900, 3] ;Intro for round 1
type = ChangeState
trigger1 = roundno = 1
value = 190


;---------------------------------------------------------------------------
; States that are always executed (use statedef -2)
;---------------------------------------------------------------------------

[Statedef -2]

; Within StateDef -2, none of your own AI-related code should be placed
; above these next six controllers.

; This method works somewhat in Linux Mugen version 2002.04.14,
; whereas the old humanly-impossible commands method does not.
; Note that this part won't work nearly as well if AI.Cheat is turned off
; in mugen.cfg.
[State -2, XOR]
type = VarSet
triggerall = var(58)!=1
triggerall = !var(56) && !IsHelper
triggerall = var(57) = GameTime
trigger1 = command = "a" ^^ command = "a2"
trigger2 = command = "b" ^^ command = "b2"
trigger3 = command = "c" ^^ command = "c2"
trigger4 = command = "x" ^^ command = "x2"
trigger5 = command = "y" ^^ command = "y2"
trigger6 = command = "z" ^^ command = "z2"
trigger7 = command = "start" ^^ command = "start2"
trigger8 = command = "holda" ^^ command = "holda2"
trigger9 = command = "holdb" ^^ command = "holdb2"
trigger10 = command = "holdc" ^^ command = "holdc2"
trigger11 = command = "holdx" ^^ command = "holdx2"
trigger12 = command = "holdy" ^^ command = "holdy2"
trigger13 = command = "holdz" ^^ command = "holdz2"
trigger14 = command = "holdstart" ^^ command = "holdstart2"
trigger15 = command = "holdfwd" ^^ command = "holdfwd2"
trigger16 = command = "holdback" ^^ command = "holdback2"
trigger17 = command = "holdup" ^^ command = "holdup2"
trigger18 = command = "holddown" ^^ command = "holddown2"
trigger19 = command = "recovery" ^^ command = "recovery2"
; Add more as desired. (See my notes in the CMD.)
var(58) = 1

[State -2, fiXOR]
type = VarAdd
trigger1 = var(56) > 0 && !IsHelper
var(56) = -1

[State -2, fiXOR2]; Optional.
type = VarSet
triggerall = var(56) && !IsHelper
triggerall = var(57) = GameTime
trigger1 = command != "a" && command != "a2"
trigger1 = command != "b" && command != "b2"
trigger1 = command != "c" && command != "c2"
trigger1 = command != "x" && command != "x2"
trigger1 = command != "y" && command != "y2"
trigger1 = command != "z" && command != "z2"
trigger1 = command != "start" && command != "start2"
trigger1 = command != "holda" && command != "holda2"
trigger1 = command != "holdb" && command != "holdb2"
trigger1 = command != "holdc" && command != "holdc2"
trigger1 = command != "holdx" && command != "holdx2"
trigger1 = command != "holdy" && command != "holdy2"
trigger1 = command != "holdz" && command != "holdz2"
trigger1 = command != "holdstart" && command != "holdstart2"
trigger1 = command != "holdfwd" && command != "holdfwd2"
trigger1 = command != "holdback" && command != "holdback2"
trigger1 = command != "holdup" && command != "holdup2"
trigger1 = command != "holddown" && command != "holddown2"
trigger1 = command != "recovery" && command != "recovery2"
; Numbered triggers here must match those in the XOR controller above.
var(56) = 0

[State -2, fuXOR]
type = VarSet
trigger1 = var(57) != GameTime && !IsHelper
var(56) = 31
IgnoreHitPause = 1

[State -2, StopAI]
type = VarSet
triggerall = var(58) > 0 && !IsHelper
trigger1 = RoundState != 2
trigger2 = !Alive
var(58) = -2
IgnoreHitPause = 1

; This controller is optional.  It allows you to treat the AI flag as a boolean
; value rather than an integer value, letting you trigger your AI directives
; with "var(0)" instead of "var(58)>0", and letting you make moves usable only
; by humans by using "!var(0)" instead of "var(58)<1", thus slightly improving
; the size and efficiency of your code.
; Another benefit is that it makes it much easier for users to disable your AI,
; if they so choose.
[State -2, Simplifier]
type = VarSet
triggerall = !IsHelper
trigger1 = var(58) = 1
trigger2 = var(0):=0
var(0) = 1	; Another option is to replace 1 with something like MatchNo, if
		; you want to design your AI to have varying levels of difficulty.
IgnoreHitPause = 1

;[State -2, DTC]
;type = DisplayToClipboard
;trigger1 = 1
;text = "var(58) = %d, var(0) = %d, RoundState = %d, IsHomeTeam = %d, var(57) = %d"
;params = var(58), var(0), RoundState, IsHomeTeam, var(57)
;IgnoreHitPause = 1

;[State -2, ATC]
;type = AppendToClipboard
;trigger1 = 1
;text = "\nMatchNo = %d, var(56) = %d"
;params = MatchNo, var(56)
;IgnoreHitPause = 1


;====================================
[State -2, Say]
type = DisplayToClipboard
trigger1 = 1
ignorehitpause = 1
text = "Kagome-sama by VinceJ. Like or Hate the character?\nComment at: http://vincej.piiym.net/"

[State -2]
type = VarSet
triggerall = TeamMode = simul
triggerall = Alive
trigger1 = partner, Alive
var(5) = 0
ignorehitpause = 1
persistent = 0

[State -2]
type = VarAdd
triggerall = TeamMode = simul
triggerall = Alive = 1
trigger1 = partner, Alive = 0 && Time = 15
var(5) = 2
ignorehitpause = 0
persistent = 1

[State -2, Kagome Alone]
type = PlaySnd
triggerall = TeamMode = simul
triggerall = Alive = 1 && Life <= 250
trigger1 = var(5) = 2 && Time > 10
value = 0, 0
channel = 1
persistent = 0
ignorehitpause = 0

[State -2, Kagome Alright]
type = PlaySnd
triggerall = TeamMode = simul
triggerall = Alive = 1 && Life > 250
triggerall = partner, Name != "Inuyasha by VinceJ"
trigger1 = var(5) = 2 && Time > 8
value = 0, 1
channel = 1
persistent = 0
ignorehitpause = 0

[State -2, Kagome Inuyasha]
type = PlaySnd
triggerall = TeamMode = simul
triggerall = Alive = 1 && Life > 250
triggerall = partner, Name = "Inuyasha by VinceJ"
trigger1 = var(5) = 2 && Time > 8
value = 0, 2
channel = 1
persistent = 0
ignorehitpause = 0

[State -2]
type = VarSet
triggerall = TeamMode = simul
triggerall = Alive = 1
trigger1 = var(5) > 2
var(5) = 1
ignorehitpause = 1
persistent = 0

[State -2, Dizzy]
type = PlaySnd
triggerall = Time = 1
trigger1 = anim = 5300
value = 5300, 0 ;Fix Japanese Dizzy sound
channel = 1

[State -2, HighHits]
type = PlaySnd
triggerall = alive
triggerall = random <= 500
triggerall = time = 1
trigger1 = StateNo = 5000
value = 5000,0
channel = 1

[State -2, LowHits]
type = PlaySnd
triggerall = alive
triggerall = random <= 500
triggerall = time = 1
trigger1 = StateNo = 5010
value = 5000,1
channel = 1

[State -2, Hard]
type = PlaySnd
triggerall = alive
triggerall = random <= 500
triggerall = time = 1
trigger1 = StateNo = 5020
trigger2 = (StateNo = 5040 || Stateno = 5050 || Stateno = 5070)
value = 5000,2
channel = 1

[State -2, IY]
type = PlaySnd
triggerall = alive
triggerall = TeamMode = simul
triggerall = Alive = 1 && partner, Alive
triggerall = partner, Name = "Inuyasha by VinceJ"
triggerall = random <= 500
triggerall = time = 1
trigger1 = StateNo = 5020
trigger2 = (StateNo = 5040 || Stateno = 5050 || Stateno = 5070)
value = 5000,3
channel = 1

[State -2, Trans]
type = Trans
trigger1 = PalNo = 9
trans = addalpha
alpha = 128,128

[State -2, VarSet]
type = VarRandom
trigger1 = var(3) = 0
v = 3
range = 1,2

;---------------------------------------------------------------------------
; States that are executed when in self's state file (use statedef -3)
;---------------------------------------------------------------------------

[Statedef -3]
; It is very important that this controller NOT be moved to State -2, as putting
; it there would defeat the entire purpose of the controller, allowing the
; helper method to erroneously set the AI variable.
; And within State -3, don't put any ChangeState controllers before this
; controller, lest you unnecessarily delay your character's AI activation.
[State -3, GameTimeVar]
type = VarSet
trigger1 = !IsHelper
var(57) = GameTime
IgnoreHitPause = 1

[State -3, TurnBackOnAI]
type = VarSet
trigger1 = var(58) = -2 && !IsHelper
trigger1 = Alive && RoundState = 2
var(58) = 1

[State -3, Getup]
type = PlaySnd
triggerall = alive
triggerall = random <= 500
triggerall = time = 1
trigger1 = Stateno = 5120
value = 5070,0
channel = 1

[State -3, Landing Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 106
trigger2 = stateno = 101
trigger3 = stateno = 52
value = 40, 0

[State -3, Jump Sound]
type = PlaySnd
triggerall = Time = 1
trigger1 = stateno = 105
trigger2 = stateno = 100
value = 45, 0

;Stand Guard
[State -3: StandGuard]
type = ChangeState
triggerall = Var(0) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing)
trigger1 = (P2StateType != C) && (P2MoveType = A) && ((P2Dist X < 150) || (EnemyNear, NumProj > 0))
trigger2 = (StateNo = 52)
value = 130

;Crouch Guard
[State -3: CrouchGuard]
type = ChangeState
triggerall = Var(0) && (StateType != A) && (Ctrl) && (EnemyNear, Facing != Facing)
trigger1 = (P2StateType = C) && (P2MoveType = A) && ((P2Dist X < 150) || (EnemyNear, NumProj > 0))
trigger2 = (StateNo = 52) || ((PrevStateNo = 5120) && (P2MoveType = A))
value = 131

;Aerial Guard
[State -3: AerialGuard]
type = ChangeState
triggerall = Var(0) && (P2MoveType = A) && ((P2Dist X < 150) || (EnemyNear, NumProj > 0))
trigger1 = ((StateType = A) && (Ctrl))
value = 132
