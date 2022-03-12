extends Area

onready var pickedUp = false

func _on_Mushroom_Pickup_body_entered(body):
	if body is KinematicBody and pickedUp == false:
		print("player picking up shrooms")
		pickedUp = true
		visible = false
		WorldShifter.numberOfShrooms += 4
	
