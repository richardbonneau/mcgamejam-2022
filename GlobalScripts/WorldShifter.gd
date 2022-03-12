extends Node

onready var isMushroomWorld = false
onready var numberOfShrooms = 0
onready var onCooldown = false
var shroomObj
var statusUI
var mushTimer
var recoveryTimer

func defineShroomObj(shroom):
	shroomObj = shroom

func defineStatusUI(ui):
	statusUI = ui
	mushTimer = statusUI.get_child(0)
	recoveryTimer = statusUI.get_child(1)

func _input(event):
	if event.is_action_pressed("ui_accept") and !onCooldown: 
		print("input")
		isMushroomWorld = true
		shroomObj.visible = false
		statusUI.showMushTimer = true
		# play sound
		# start timer
		mushTimer.start()
		# show timer
		onCooldown = true

func mushTimerOver():
	print("mushTimerOver")
	statusUI.showMushTimer = false
	statusUI.showRecoveryTimer = true
	mushTimer.stop()
	recoveryTimer.start()
	isMushroomWorld = false

func recoveryTimerOver():
	print("recoveryTimerOver")
	recoveryTimer.stop()
	statusUI.showRecoveryTimer = false
	shroomObj.visible = true
	onCooldown = false
