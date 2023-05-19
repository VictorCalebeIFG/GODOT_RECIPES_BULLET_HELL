extends KinematicBody2D

var speed = 1
var direction: Vector2

func _physics_process(delta):
	if direction:
		move_and_collide(direction.normalized()*speed)

