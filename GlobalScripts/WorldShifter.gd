extends Node

onready var isMushroomWorld = false

func _input(event):
	if event.is_action_pressed("ui_accept"): 
		isMushroomWorld = !isMushroomWorld
