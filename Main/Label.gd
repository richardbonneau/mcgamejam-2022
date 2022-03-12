extends Label

onready var showMushTimer = false
onready var showRecoveryTimer = false

func _ready():
	WorldShifter.defineStatusUI(self)

func _process(delta):
	if(showMushTimer): text = "???\n"+String(int($MushTimer.time_left))
	elif(showRecoveryTimer): text = "Recovering\n"+String(int($RecoveryTimer.time_left))

func _on_MushTimer_timeout():
	print("_on_MushTimer_timeout")
	WorldShifter.mushTimerOver()


func _on_RecoveryTimer_timeout():
	print("_on_RecoveryTimer_timeout")
	WorldShifter.recoveryTimerOver()
