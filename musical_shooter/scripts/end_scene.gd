extends Node2D
#@onready var scene = "res://scenes/garden_game.tscn"



	
func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventKey and event.keycode == KEY_ESCAPE:
		get_tree().quit()	

#func _process(delta):
#	$Label.text="Flowers Bloomed: " + str(scene.flower_count)
	
