extends Node2D

@onready var animated_hit= $AnimatedSprite2D
@onready var hurt_sound = $hurt_sound


func _ready() -> void:

	animated_hit.play("hit")
	hurt_sound.play()
	await get_tree().create_timer(1.0).timeout		
	$".".hide()
