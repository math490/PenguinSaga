extends AnimatedSprite2D

@onready var cursor: AnimatedSprite2D = $"."

enum CursorState {
	default,
	point,
	before_grab,
	grab
}

var status: CursorState

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	CursorManager.changed_to_button.connect(_on_cursor_change)

func _process(_delta):
	
	cursor.global_position = cursor.get_global_mouse_position()
	
	match status:
		CursorState.default:
			default_state()
		CursorState.point:
			point_state()
		CursorState.before_grab:
			before_grab_state()
		CursorState.grab:
			grab_state()

func go_to_default_state():
	status = CursorState.default
	cursor.play("default")

func go_to_point_state():
	status = CursorState.point
	cursor.play("point")

func go_to_before_grab_state():
	status = CursorState.before_grab
	cursor.play("before_grab")

func go_to_grab_state():
	status = CursorState.grab
	cursor.play("grab")

func default_state():
	pass

func point_state():
	pass

func before_grab_state():
	pass

func grab_state():
	pass

func _on_cursor_change(no_botao: bool) -> void:
	if no_botao:
		go_to_point_state()
	else:
		go_to_default_state()
