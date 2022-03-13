extends Spatial

func _process(delta):
	look_at(WorldShifter.player.get_global_transform().origin, Vector3.UP)


