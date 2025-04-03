extends CharacterBody2D
class_name Water

var speed = 400

func _process(delta):
  move_local_y(speed * delta)




#var speed = 300 

#func _physics_process(delta):
	#var collision_info = move_and_collide(velocity.normalized() * delta * speed)
