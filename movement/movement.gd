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
			if $Tween.is_active() == false:
				move(dir)
		if event.is_action_pressed("ui_up"):
			_animated_sprite.play("walk_up")
		if event.is_action_pressed("ui_down"):
			_animated_sprite.play("walk_down")
		if event.is_action_pressed("ui_left"):
			_animated_sprite.play("walk_left")
		if event.is_action_pressed("ui_right"):
			_animated_sprite.play("walk_right")
		


func move(dir):
	var vector_pos = inputs[dir] * gridsize
	ray.cast_to = vector_pos * 2
	ray.force_raycast_update()
	$Tween.interpolate_property(
		$Player, #or whatever the name of your sprite is
		"position",
		$Player.position - vector_pos,
		Vector2(0, 5),
		.5,
		Tween.TRANS_SINE,
		Tween.EASE_IN_OUT
	)
	if !ray.is_colliding():
		$Tween.start()
		position += vector_pos
		
		
	

		


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Player_animation_finished():
	if _animated_sprite.animation == "walk_up":
		_animated_sprite.animation = "idle_up"
	if _animated_sprite.animation == "walk_right":
		_animated_sprite.animation = "idle_right"
	if _animated_sprite.animation == "walk_down":
		_animated_sprite.animation = "idle_down"
	if _animated_sprite.animation == "walk_left":
		_animated_sprite.animation = "idle_left"
