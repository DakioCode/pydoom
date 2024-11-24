extends Node

@onready var animation_player = $SceneTransition/AnimationPlayer

func _ready() -> void:
	$SceneTransition/ColorRect.visible = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")

func load_scene(path: String) -> void:
	animation_player.play("Fade")
	
	await animation_player.animation_finished
	
	get_tree().change_scene_to_file(path)
	
	animation_player.play_backwards("Fade")
	
	await animation_player.animation_finished

func reload_scene() -> void:
	pass
