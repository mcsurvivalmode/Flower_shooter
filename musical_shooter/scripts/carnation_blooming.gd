extends Node2D

@onready var animated_carnation = $AnimatedSprite2D
@onready var fun_sound = $fun_sound


func _ready() -> void:
	animated_carnation.play("car_bloom")
	fun_sound.play()
