extends Marker2D

# The thing to spawn
@export var flower_scene_2:PackedScene

@export var radius:float = 200
@export var count:int = 20

@export var rate:int = 10

@export var auto_spawn = true



func spawn():
	print("begin spawning")
	var theta_inc = TAU / float(count)
	
	for i in count:
		print ()
		await get_tree().create_timer(1 / float(rate)).timeout
		var theta = theta_inc * i
		var x = sin(theta) * radius
		var y = - cos(theta) * radius
		var flower = flower_scene_2.instantiate()
		
		# ufo.color = color
		flower.position = position + Vector2(x, y)		
		get_parent().add_child(flower)
		
func _ready():
	if auto_spawn:
		spawn()
