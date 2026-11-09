extends Area2D

@onready var collision: CollisionShape2D = $CollisionShape2D
func _on_body_entered(_body: Node2D) -> void:
	collision.set_deferred("disabled", true)
	queue_free()
	GameManager.add_coin()
