extends Spatial

signal clicked
var type = "tile"
var should_interpolate = false
var t = 0
var last_color_code
export(Color) var tile_default_color
onready var material = $MeshInstance.get_surface_material(0)
var row_col

func _process(delta: float) -> void:
	if (should_interpolate):
		t += delta * 1
		if (t >= 1):
			should_interpolate = false
			t = 0
			material.albedo_color = tile_default_color
			$MeshInstance.set_surface_material(0, material)
			return
		material.albedo_color = material.albedo_color.linear_interpolate(tile_default_color, t)
		$MeshInstance.set_surface_material(0, material)

func back_to_default_color():
	should_interpolate = true

func _on_Area_input_event(camera: Node, event: InputEvent, click_position: Vector3, click_normal: Vector3, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if !event.pressed:
			emit_signal("clicked", self, event.button_index, row_col)
	
