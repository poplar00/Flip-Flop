extends state

@onready var player : CharacterBody2D = get_parent().get_parent()
@onready var animation_player : AnimationPlayer = get_parent().get_parent().get_node("AnimationPlayer")
@onready var jump: AudioStreamPlayer2D = $"../../jump"

func Enter():
	jump.play()
	animation_player.play("jump")
	player.velocity.y = player.jump_force
	player.move_and_slide()
	
func Exit():
	pass
	
func Update(_delta:float):
	if player.IS_ALIVE == false:
		Transitioned.emit(self, "death")  

	
	if not player.is_on_floor():
		Transitioned.emit(self, "airborne")
		

func Physic_Update(_delat:float):
	player.velocity.x = player.speed
	player.move_and_slide()
		
