extends CharacterBody2D

var speed = 300.0
var jump = -525.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	if velocity.x > 1 or velocity.x < -1:
		$AnimatedSprite2D.play("run")
	else:
		$AnimatedSprite2D.play("idle")
	
	if not is_on_floor():
		velocity.y += gravity * delta
		$AnimatedSprite2D.play("jump")
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump
	
	var direction = Input.get_axis("ui_left", "ui_right")
	
	if direction:
		velocity.x = direction  * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	
	move_and_slide()
	
	if ($AnimatedSprite2D.flip_h and velocity.x == 0) or velocity.x < 0:
		$AnimatedSprite2D.flip_h = true
	else:
		$AnimatedSprite2D.flip_h = false
