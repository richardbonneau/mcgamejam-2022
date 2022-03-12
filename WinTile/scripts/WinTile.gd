extends Spatial

signal game_win
signal clicked

var r = 0
var g = 0
var b = 0
var r_direction = 1
var g_direction = 1
var b_direction = 1
onready var material = $Tile/MeshInstance.get_surface_material(0)
var row_col
var type = "win_tile"

func _ready():
		$Tile/Area.input_ray_pickable = false

func _process(delta: float) -> void:
	r += delta * 0.4 * r_direction
	g += delta * 0.2 * g_direction
	b += delta * 0.1 * b_direction
	if (r >= 1):
		r_direction = -1
	if (g >= 1):
		g_direction = -1
	if (b >= 1):
		b_direction = -1
	if (r <= 0):
		r_direction = 1
	if (g <= 0):
		g_direction = 1
	if (b <= 0):
		b_direction = 1
	material.albedo_color = Color(r, g, b)
	$Tile/MeshInstance.set_surface_material(0, material)

func _on_Area_body_entered(body: Node) -> void:
	$AudioStreamPlayer.play()
	emit_signal("game_win")
	body.can_move = false


func _on_Area_input_event(camera: Node, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if !event.pressed:
			emit_signal("clicked", self, event.button_index, row_col)
	
