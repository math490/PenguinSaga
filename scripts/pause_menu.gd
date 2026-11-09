extends CanvasLayer

@onready var resume_btn: Button = $menu_holder/resume_btn

func _ready() -> void:
	visible = false

func _unhandled_input(event):
	if event.is_action_pressed("escape"):
		visible = true
		get_tree().paused = true
		resume_btn.grab_focus()
		
func _on_resume_btn_pressed() -> void:
	get_tree().paused = false
	visible = false

func _on_menu_btn_pressed() -> void:
	call_deferred("load_next_level")
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/" + "title_screen" + ".tscn")

func _on_quit_btn_pressed() -> void:
	get_tree().quit()

func _on_resume_btn_mouse_entered() -> void:
	CursorManager.changed_to_button.emit(true)

func _on_menu_btn_mouse_entered() -> void:
	CursorManager.changed_to_button.emit(true)

func _on_quit_btn_mouse_entered() -> void:
	CursorManager.changed_to_button.emit(true)

func _on_resume_btn_mouse_exited() -> void:
	CursorManager.changed_to_button.emit(false)

func _on_menu_btn_mouse_exited() -> void:
	CursorManager.changed_to_button.emit(false)

func _on_quit_btn_mouse_exited() -> void:
	CursorManager.changed_to_button.emit(false)
