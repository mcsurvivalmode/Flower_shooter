extends CharacterBody2D


@export var auto_spawn = false
@onready var export = $"."
@export var ufo_count:int


var lily_bloom_prefab = preload("res://scenes/bloomed_lily.tscn")




func movement():
	var tween = create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_EXPO)	
	tween.tween_property(self, "position", position + Vector2.RIGHT * 700, 5)
	#tween.tween_property(self, "rotation", PI, 4)
	tween.tween_property(self, "position", position + Vector2.LEFT * 700, 5)
	tween.tween_property(self, "position", position + Vector2.RIGHT * 700, 5)
	#tween.tween_property(self, "position", position + Vector2.UP * 400, 5)
	#tween.tween_property(self, "position", position + Vector2.DOWN * 400, 5)
	tween.finished.connect(movement)
		
	pass

func _ready() -> void:
	# Tween my scale using elastic	
	if ! Engine.is_editor_hint():
		scale = Vector2.ZERO
		var tween = create_tween().set_trans(Tween.TRANS_ELASTIC).set_ease(Tween.EASE_IN_OUT)
		tween.tween_property(self, "scale", Vector2.ONE, 0.1)
		tween.finished.connect(movement)
	
	
		# wait 2 seconds
		await get_tree().create_timer(2.0).timeout		
		randomise_timer()
		
func randomise_timer():
	# randomise the wait time
	$Timer.wait_time = randf_range(1, 5)
	$Timer.start()
	



	 


func _on_hitbox_area_entered(area: Area2D) -> void: #plays animation when flower bud is hit 
	print("HITHITHIT")
	export.ufo_count += 1
	print(export.ufo_count)
	#spawn flower 
	var lily_flower = lily_bloom_prefab.instantiate()
	lily_flower.position = global_position
	get_tree().root.add_child(lily_flower)
	queue_free()
	area.queue_free()
	
