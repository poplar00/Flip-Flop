extends state

@onready var player : CharacterBody2D = get_parent().get_parent()
@onready var animation_player : AnimationPlayer = get_parent().get_parent().get_node("AnimationPlayer")

func Enter():
	animation_player.play("running")

func Update(delta: float):
	if Input.is_action_just_pressed("JUMP"):
		Transitioned.emit(self, "jump")

	
	if player.IS_ALIVE == false:
		Transitioned.emit(self, "death")  

	
	#if not player.is_on_floor():
		#Transitioned.emit(self, "airborne")
		
func Physic_Update(delta:float):
	player.velocity.x =  player.speed
	player.move_and_slide()
	
