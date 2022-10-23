extends Area2D

var occupied = false

func on_cage_body_entered():
	get_tree().change_scene("res://movement/level_2.tscn")
	print("cage")
	
	
	
	
	
	

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
