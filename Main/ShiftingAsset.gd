extends Spatial

onready var isMushroomWorld = false

func _process(delta):
	if(WorldShifter and WorldShifter.isMushroomWorld != isMushroomWorld):
		var worldToHide = null
		var worldToShow = null
		
		if(WorldShifter.isMushroomWorld):
			worldToHide = $World1
			worldToShow = $World2
		else:
			worldToHide = $World2
			worldToShow = $World1
			
		worldToHide.visible = false
		worldToShow.visible = true
		
		isMushroomWorld = WorldShifter.isMushroomWorld

