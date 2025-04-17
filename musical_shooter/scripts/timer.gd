extends Control

var label = Label
var timer = Timer 

func _ready():
	label = $timer
	timer = $Timer
	
	timer.start()

	
func _process(delta):
	update_label_text()
	

	
func update_label_text():
	label.text = str(ceil(timer.time_left))


func _on_timer_timeout() -> void:
	get_tree().change_scene_to_file("res://scenes/end_scene.tscn")
