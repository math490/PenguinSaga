extends Control

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/forest.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_start_mouse_entered() -> void:
	CursorManager.changed_to_button.emit(true)

func _on_quit_mouse_entered() -> void:
	CursorManager.changed_to_button.emit(true)

func _on_start_mouse_exited() -> void:
	CursorManager.changed_to_button.emit(false)

func _on_quit_mouse_exited() -> void:
	CursorManager.changed_to_button.emit(false)
