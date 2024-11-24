extends Node

func load_level(path: String) -> void:
	GameController.load_scene(path)

func _on_level_1_pressed() -> void:
	load_level("res://Scenes/Levels/level1.tscn")

func _on_level_2_pressed() -> void:
	pass
