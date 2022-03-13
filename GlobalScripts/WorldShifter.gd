extends Node

onready var isMushroomWorld = false
onready var mushroomPickedUp = false
onready var onCooldown = false
var shroomObj
var statusUI
var mushTimer
var recoveryTimer
var player

var camera
onready var normalEnv = preload("res://Ressources/NormalEnv.tres")
onready var mushEnv = preload("res://Ressources/MushEnv.tres")
var takingMushroomsSound
var recoverySound

func definePlayer(p):
	player = p
	
func defineShroomObj(shroom):
	shroomObj = shroom

func defineStatusUI(ui):
	statusUI = ui
	mushTimer = statusUI.get_child(0)
	recoveryTimer = statusUI.get_child(1)

func defineCamera(cam):
	camera = cam
	takingMushroomsSound = cam.get_child(0)
	recoverySound = cam.get_child(1)
	

func _input(event):
	if event.is_action_pressed("ui_accept") and !onCooldown and mushroomPickedUp: 
		print("input")
		isMushroomWorld = true
		shroomObj.visible = false
		statusUI.showMushTimer = true
		mushTimer.start()
		camera.environment = mushEnv
		onCooldown = true
		takingMushroomsSound.play()

func mushTimerOver():
	print("mushTimerOver")
	statusUI.showMushTimer = false
	statusUI.showRecoveryTimer = true
	camera.environment= normalEnv
	mushTimer.stop()
	recoveryTimer.start()
	isMushroomWorld = false
	recoverySound.play()

func recoveryTimerOver():
	print("recoveryTimerOver")
	recoveryTimer.stop()
	statusUI.showRecoveryTimer = false
	shroomObj.visible = true
	onCooldown = false
