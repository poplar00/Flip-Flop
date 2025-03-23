extends Control

var score = 0
@onready var score_label: Label = $Score
@onready var ui: CanvasLayer = $".."
@onready var player: CharacterBody2D = $"../../Player"


func _process(delta: float) -> void:
	if player.IS_ALIVE == true:
		score += 0.1
	else:
		await get_tree().create_timer(1).timeout
		ui.hide()
	score_label.text = "Distance: %d M" % score
