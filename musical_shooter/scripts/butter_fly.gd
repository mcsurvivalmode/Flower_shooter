extends CharacterBody2D


@export var auto_spawn = false
@onready var scene = $".."
@onready var animated_fly = $AnimatedSprite2D


var hit_prefab = preload("res://scenes/butterfly_hit.tscn")



func movement():
	var tween = create_tween()
	
	tween.tween_property(self, "position", position + Vector2.RIGHT * 3000, 5)

	#tween.tween_property(self, "position", position + Vector2.RIGHT * 800, 5)
	
	
	#tween.tween_property(self, "position", position + Vector2.UP * 400, 5)
	#tween.tween_property(self, "position", position + Vector2.DOWN * 400, 5)
	tween.finished.connect(movement)
		
	pass

func _ready() -> void:
	animated_fly.play("fly")
	
	# Tween my scale using elastic	
	if ! Engine.is_editor_hint():
		scale = Vector2.ZERO
		var tween = create_tween()
		tween.tween_property(self, "scale", Vector2.ONE, 0.1)
		tween.finished.connect(movement)
	
	
		# wait 2 seconds
		await get_tree().create_timer(2.0).timeout		
		randomise_timer()
		
func randomise_timer():
	# randomise the wait time
	$Timer.wait_time = randf_range(1, 5)
	$Timer.start()
	


func _on_butter_hit_area_entered(area: Area2D) -> void:
	print("butterfly hit")
	scene.score -= 5
	#spawn flower 
	
	
	var hit_anim = hit_prefab.instantiate()
	hit_anim.position = global_position
	get_tree().root.add_child(hit_anim)
	queue_free()
	area.queue_free()
