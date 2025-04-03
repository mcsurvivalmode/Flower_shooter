extends Node2D

@onready var animated_lily = $AnimatedSprite2D
@onready var sparkly_sound = $SparklySound


func _ready() -> void:
	animated_lily.play("lily_bloom")
	sparkly_sound.play()
	
