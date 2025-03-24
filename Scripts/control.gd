extends Control

var score = 0
@onready var score_label: Label = $Score
@onready var ui: CanvasLayer = $".."
@onready var player: CharacterBody2D = $"../../Player"


func _process(delta: float) -> void:
	score += 1.5 * delta
	if player.is_on_floor():
		score += 6.5 * delta
		if player.SUPER:
			score *= 3
	if player.IS_ALIVE != true:
		await get_tree().create_timer(1).timeout
		ui.hide()
	score_label.text = "Score: %d M" % score
