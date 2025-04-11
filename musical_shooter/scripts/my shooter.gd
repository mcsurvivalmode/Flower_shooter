extends Node2D

# when the scene is loaded, assign these variables from the scene
@onready var flower_spawner = $flower_spawner
#@onready var player = $Player
@export var ufo_count:int = 0
var target = 2
var level = 1

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().quit()	
		
		
		
func _process(delta):
	# if the dude reaches the target, advance to next level
	if ufo_count == target:
		print("next level")
		next_level()
		$CanvasLayer/level.text="level: " + str(level)
	
		
func next_level():
	flower_spawner.radius = randf_range(200, 500)
	flower_spawner.count = 2
	flower_spawner.rate  = 100
	flower_spawner.spawn()	
	level = level + 1
	# next target
	target = target + flower_spawner.count
