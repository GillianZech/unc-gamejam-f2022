extends KinematicBody2D

onready var _animated_sprite = $Player

var dir = Vector2()

onready var ray = $RayCast2D

var gridsize = 24

var inputs = {
	"ui_up": Vector2.UP,
	"ui_down": Vector2.DOWN,
	"ui_right": Vector2.RIGHT,
	"ui_left": Vector2.LEFT
}

func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
			_animated_sprite.play("walk")
			
		else:
			 _animated_sprite.play("idle")
		if event.is_action_pressed("ui_up"):
			rotation = 4.71239
		if event.is_action_pressed("ui_down"):
			rotation = 1.5708
		if event.is_action_pressed("ui_left"):
			rotation = 3.14159
		if event.is_action_pressed("ui_right"):
			rotation = 0
		

func move(dir):
	var vector_position = inputs[dir] * gridsize
	ray.cast_to = vector_position
	ray.force_raycast_update()
	if !ray.is_colliding():
		position += vector_position

	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
