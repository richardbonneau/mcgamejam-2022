extends Spatial

onready var numberOfShrooms = 0

func _process(delta):
	if(WorldShifter.numberOfShrooms != numberOfShrooms):
		# if player has more than one shroom, show them in the hands
		if(WorldShifter.numberOfShrooms > 0): visible = true
		# if player has zero shrooms, hide them from the hands
		else:visible = false
		
		numberOfShrooms = WorldShifter.numberOfShrooms
