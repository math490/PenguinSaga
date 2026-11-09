extends CanvasLayer

@onready var hearts_container: HBoxContainer = %HeartsContainer
@onready var score_label: Label = %ScoreLabel
@onready var coin_label: Label = %CoinLabel

@export var heart_full_texture = Texture2D
@export var heart_empty_texture = Texture2D

func _ready() -> void:
	GameManager.score_changed.connect(update_score)
	GameManager.health_changed.connect(update_lives)
	GameManager.coins_changed.connect(update_coins)
	
	update_score(GameManager.score)
	update_lives(GameManager.current_health, GameManager.max_health)
	update_coins(GameManager.coins)

func update_coins(amount: int) -> void:
	coin_label.text = str(amount).pad_zeros(3)

func update_score(new_score: int) -> void:
	score_label.text = "%06d" % new_score

func update_lives(current_lives: int, max_lives: int = 3) -> void:
	for child in hearts_container.get_children():
		child.queue_free()
	
	for i in range(max_lives):
		var heart_rect = TextureRect.new()
		heart_rect.expand_mode = TextureRect.EXPAND_KEEP_SIZE
		heart_rect.stretch_mode = TextureRect.STRETCH_KEEP_CENTERED
		
		if i < current_lives:
			heart_rect.texture = heart_full_texture
		else:
			heart_rect.texture = heart_empty_texture
		
		hearts_container.add_child(heart_rect)
