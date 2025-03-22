extends Area2D


@onready var player : CharacterBody2D = get_parent()

func _on_area_entered(area: Area2D) -> void:
	player.IS_ALIVE = false
	print(player.IS_ALIVE)
