extends CharacterBody2D

# speed in pixels/sec
var speed = 500 
const bulletPath = preload("res://water.tscn")
var water_speed = 100

func _physics_process(_delta):
# setup direction of movement
	var direction = Input.get_vector("left", "right", "up", "down")
# stop diagonal movement by listening for input then setting axis to zero
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y = 0
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
		
		
	
#normalize the directional movement
	direction = direction.normalized()
# setup the actual movement
	velocity = (direction * speed)
	move_and_slide()
	
		#SHOOTING??
	
func _process(_delta):
	if Input.is_action_just_pressed("space"):
		print("SHOOOT")
		shoot()
		
func shoot():
	var water = bulletPath.instantiate()
	
	get_parent().add_child(water)
	water.position = $Marker2D2.global_position
