extends state

@onready var player : CharacterBody2D = get_parent().get_parent()
@onready var animation_player : AnimationPlayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var gameover : CanvasLayer = player.get_parent().get_node("CanvasLayer")
@onready var explosive: AudioStreamPlayer2D = $"../../explosive"

func Enter():
	explosive.play()
	player.speed = 0
	animation_player.play("dies")
	gameover.gameover()
	#get_tree().reload_current_scene()
	
func Exit():
	pass
	
func Update(_delta:float):
	pass
func Physic_Update(_delat:float):
	pass
		
