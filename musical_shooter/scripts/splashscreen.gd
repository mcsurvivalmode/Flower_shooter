extends Control



#func _on_quit_button_pressed() -> void:
	#get_tree().quit()


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/node_2d.tscn")
