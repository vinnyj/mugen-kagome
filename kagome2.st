;=====================================================
;=  Duplicate Start                                  =
;=====================================================
;---------------------------------------------------
;Stand Light Punch3 Duplicate
[Statedef 204]
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

[State 204, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 204, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 204, 3]
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
ID = 204


[State 204, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------
;Standing Strong Punch 3

[Statedef 224]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 6,0
anim = 211
sprpriority = 2

[State 224, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 224, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 224, 3]
type = Width
trigger1 = (AnimElemTime (4) >= 0) && (AnimElemTime (10) < 0)
value = 25,0

[State 224, 4]
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


[State 224, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------
;Stand Light Punch4
[Statedef 206]
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

[State 206, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 206, 2]
type = PlaySnd
trigger1 = AnimElem = 3
value = 200, 2
channel = 1

[State 206, Mystic]
type = PlaySnd
trigger1 = AnimElem = 5
value = 3000, 1
channel = 2

[State 206, 3]
type = Width
trigger1 = (AnimElemTime (7) >= 0) && (AnimElemTime (23) < 0)
value = 25,0

[State 206, 5]
type = Explod
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

[State 206, 6]
type = Projectile
trigger1 = Animelem = 7
attr = S, NA                     ;Attribute: Standing, Normal Attack
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
hitsound   = S5,2
guardsound = S6,0
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
projID = 3000
projremanim = 3001
projremove = 0
projremovetime = 34
projpriority = 13
projsprpriority = 3
offset = 34,-58
postype = p1
fall = 1
fall.recover = 0
ID = 206


[State 206, 8]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Crouching light punch 3 Duplicate

[Statedef 404]
type    = C
movetype= A
physics = C
juggle  = 5
poweradd= 0
ctrl = 0
anim = 401
velset = 6,0
sprpriority = 2

[State 404, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 404, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 404, 3]
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


[State 404, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching strong punch3 Duplicate

[Statedef 424]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 411
velset = 6,0
sprpriority = 2

[State 424, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 424, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1

[State 424, 3]
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


[State 424, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;----------------------------------
;Standing Strong Punch 2 Duplicate

[Statedef 222]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 0,0
anim = 210
sprpriority = 2

[State 222, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 222, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 3
channel = 1

[State 222, 3]
type = Width
trigger1 = (AnimElemTime (4) >= 0) && (AnimElemTime (10) < 0)
value = 25,0

[State 222, 4]
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


[State 222, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Crouching strong punch2 Duplicate

[Statedef 422]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 410
velset = 4,0
sprpriority = 2

[State 422, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 422, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 3

[State 422, 3]
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


[State 422, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;----------------------------------
;Standing Strong Punch 3

[Statedef 232]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 6,0
anim = 211
sprpriority = 2

[State 232, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 232, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 232, 3]
type = Width
trigger1 = (AnimElemTime (4) >= 0) && (AnimElemTime (10) < 0)
value = 25,0

[State 232, 4]
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
ID = 232


[State 232, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;----------------------------------
;Standing Strong Punch 3

[Statedef 236]
type    = S
movetype= A
physics = S
juggle  = 4
poweradd= 0
ctrl = 0
velset = 6,0
anim = 211
sprpriority = 2

[State 236, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 236, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 236, 3]
type = Width
trigger1 = (AnimElemTime (4) >= 0) && (AnimElemTime (10) < 0)
value = 25,0

[State 236, 4]
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
ID = 236


[State 236, 5]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Crouching strong punch3

[Statedef 432]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 411
velset = 6,0
sprpriority = 2

[State 432, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 432, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1

[State 432, 3]
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


[State 432, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Crouching strong punch3

[Statedef 436]
type    = C
movetype= A
physics = C
juggle  = 6
poweradd= 0
ctrl = 0
anim = 411
velset = 6,0
sprpriority = 2

[State 436, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 436, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1

[State 436, 3]
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


[State 436, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;Stand Light Punch3
[Statedef 242]
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

[State 242, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 242, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 242, 3]
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
hitsound   = S5,2
guardsound = S6,0
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
ID = 242


[State 242, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;Stand Light Punch3
[Statedef 252]
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

[State 252, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 252, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 252, 3]
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
hitsound   = S5,2
guardsound = S6,0
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
ID = 252


[State 252, 7]
type = ChangeState
trigger1 = AnimTime = 0
value = 0
ctrl = 1

;---------------------------------------------------------------------------
;Crouching light punch 3

[Statedef 442]
type    = C
movetype= A
physics = C
juggle  = 5
poweradd= 0
ctrl = 0
anim = 401
velset = 6,0
sprpriority = 2

[State 442, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 442, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 442, 3]
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


[State 442, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;---------------------------------------------------------------------------
;Crouching light punch 3

[Statedef 452]
type    = C
movetype= A
physics = C
juggle  = 5
poweradd= 0
ctrl = 0
anim = 401
velset = 6,0
sprpriority = 2

[State 452, 1]
type = StopSnd
trigger1 = Animelem = 1
channel = 1

[State 452, 2]
type = PlaySnd
trigger1 = AnimElem = 2
value = 200, 1
channel = 1

[State 452, 3]
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


[State 452, 4]
type = ChangeState
trigger1 = AnimTime = 0
value = 11
ctrl = 1

;=====================================================
;=  Duplicate End                                    =
;=====================================================