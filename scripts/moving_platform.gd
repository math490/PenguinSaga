extends AnimatableBody2D
@onready var target: Sprite2D = $Target
@export var time = 1

func _ready() -> void:
	
	target.visible = false
	
	var origem = global_position
	var destino = origem
	destino.y = 100
	
	var tween = create_tween()
	tween.set_trans(Tween.TRANS_QUAD)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(self, "global_position", target.global_position, time)
	tween.tween_property(self, "global_position", origem, time)
	tween.set_loops()
