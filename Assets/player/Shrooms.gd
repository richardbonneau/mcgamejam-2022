extends Spatial

onready var mushroomPickedUp = false

func _ready():
	WorldShifter.defineShroomObj(self)

func _process(delta):
	if(WorldShifter.mushroomPickedUp != mushroomPickedUp):
		visible = true
		
		mushroomPickedUp = WorldShifter.mushroomPickedUp
