extends Node2D

# when the scene is loaded, assign these variables from the scene
@onready var flower_spawner = $flower_spawner
@onready var flower_spawner_2 = $flower_spawner2
@onready var flower_spawner_3 = $flower_spawner3

@export var flower_count:int = 0


var target = 3


@export var level = 1

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().quit()	



		
func _process(delta):
	$CanvasLayer/bloomed_flowers.text="Flowers Bloomed: " + str(flower_count)
	# if the dude reaches the target, advance to next level
	

	
	if level >= 5 and flower_count == target:
		
		print("LEVEL 10")
		level = level + 1
		%Level.text="level: " + str(level)
		next_level()
		final_level()
		#set_process(false)
		
			
		
	elif flower_count == target:
		
		print("next level")
	
		level = level + 1
		%Level.text="level: " + str(level)
		
		next_level()
		
	
		
func next_level():
	flower_spawner.radius = randf_range(100, 600)
	flower_spawner.count = 3
	flower_spawner.rate  = 100
	#flower_spawner.position 
	flower_spawner.spawn()	
	
	#second spawner
	flower_spawner_2.radius = randf_range(100, 600)
	flower_spawner_2.count = 5
	flower_spawner_2.rate  = 100
	#flower_spawner.position 
	flower_spawner_2.spawn()	
	
	
	print(level)
	# next target
	target = target + flower_spawner.count + flower_spawner_2.count
	
	print("target:",target)

func final_level():
	flower_spawner_3.radius = randf_range(100, 600)
	
	flower_spawner_3.rate  = 100
	#flower_spawner.position 
	flower_spawner_3.spawn()	
	
