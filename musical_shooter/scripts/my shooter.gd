extends Node2D

# when the scene is loaded, assign these variables from the scene
@onready var flower_spawner = $flower_spawner

@export var flower_count:int = 0


var target = 5
var level = 1

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().quit()	
		


		
func _process(delta):
	$CanvasLayer/bloomed_flowers .text="Flowers Bloomed: " + str(flower_count)
	# if the dude reaches the target, advance to next level
	if flower_count == target:
		
		print("next level")
		
		%Level.text="level: " + str(level)
		
		next_level()
	#	$CanvasLayer/level.text="level: " + str(level)
	
		
func next_level():
	flower_spawner.radius = randf_range(100, 600)
	flower_spawner.count = level + 3
	flower_spawner.rate  = 100
	#flower_spawner.position 
	flower_spawner.spawn()	
	level = level + 1
	# next target
	target = target + flower_spawner.count
	print("target:",target)
