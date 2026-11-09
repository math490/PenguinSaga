extends Node

signal score_changed(new_score: int)
signal coins_changed(new_amount: int)
signal health_changed(current_health: int, max_health: int)

var score: int = 0
var coins: int = 0

@export var max_health: int = 3
var current_health: int = 3

func _ready() -> void:
	current_health = max_health
	
func add_score(amount: int) -> void:
	score += amount
	score_changed.emit(score)

func add_coin(amount: int = 1) -> void:
	coins += amount
	coins_changed.emit(coins)

func take_damage(amount: int = 1) -> void:
	current_health = clamp(current_health - amount, 0, max_health)
	health_changed.emit(current_health, max_health)
	
	if current_health <= 0:
		game_over()

func game_over() -> void:
	print("Game Over!")
