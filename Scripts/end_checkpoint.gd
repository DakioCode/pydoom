extends Area2D

@export var target_scene: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		GameController.load_scene(target_scene.resource_path)
