extends Node2D

export var bullet_path:String
export(float, 0, 60, 0.1) var wait_time

onready var root_node = get_tree().get_root()

var bullet_directions: Array
var bullet_positions: Array

func _ready():
	$Timer.wait_time = wait_time
	$Timer.start()
	pass
	
func create_bullets():
	for pos2d in get_children():
		if pos2d is Position2D:
			var b = create_bullet(root_node)
			b.global_position = pos2d.global_position 
			
			b.direction =  pos2d.global_position - global_position  
	
func create_bullet(Dad):
	var bullet = load(bullet_path)
	bullet = bullet.instance()
	Dad.add_child((bullet))
	return bullet


func _on_Timer_timeout():
	create_bullets()
	pass # Replace with function body.
