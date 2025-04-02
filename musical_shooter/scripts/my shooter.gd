extends Node2D

# when the scene is loaded, assign these variables from the scene
@onready var flower_spawner = $flower_spawner
#@onready var dude = $dude

var target = 0
var level = 0

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().quit()	
