extends CharacterBody2D


@export var auto_spawn = false




func movement():
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)
	tween.tween_property(self, "rotation", PI, 2)		
	tween.tween_property(self, "position", position + Vector2.RIGHT * 500, 20)
	tween.tween_property(self, "position", position + Vector2.LEFT * 400, 20)
	tween.tween_property(self, "position", position + Vector2.UP * 400, 20)
	tween.tween_property(self, "position", position + Vector2.DOWN * 400, 2)
	tween.finished.connect(movement)
		
	pass

func _ready() -> void:
	# Tween my scale using elastic	
	if ! Engine.is_editor_hint():
		scale = Vector2.ZERO
		var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "scale", Vector2.ONE, 1)
		tween.finished.connect(movement)
		# vary the pitch
	
		# wait 2 seconds
		await get_tree().create_timer(2.0).timeout		
		randomise_timer()
		
func randomise_timer():
	# randomise the wait time
	$Timer.wait_time = randf_range(1, 5)
	$Timer.start()
	



	 
