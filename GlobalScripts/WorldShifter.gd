extends Node

onready var isMushroomWorld = false
onready var numberOfShrooms = 0

func _input(event):
	if event.is_action_pressed("ui_accept"): 
		isMushroomWorld = !isMushroomWorld
