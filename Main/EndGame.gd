extends Area

func _on_Area_body_entered(body):
	if body is KinematicBody:
		get_tree().change_scene("res://_menu/the_end.tscn")

