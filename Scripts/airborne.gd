extends state


@onready var timer: Timer = $"../../Timer"
@onready var player : CharacterBody2D = get_parent().get_parent()
@onready var animation_player : AnimationPlayer = get_parent().get_parent().get_node("AnimationPlayer")

func Enter():
	animation_player.play("airborne")
	
func Exit():
	pass
	
func Update(_delta:float):
	if player.IS_ALIVE == false:
		Transitioned.emit(self, "death")
		player.rotation = 0

	
	if player.is_on_floor():
		#await get_tree().create_timer(0.1).timeout
		Transitioned.emit(self, "move")
		

func Physic_Update(_delat:float):
	player.velocity.x = player.speed
	player.move_and_slide()
	if Input.is_action_pressed("JUMP"):
		player.rotation += player.angular
		#print(player.rotation_degrees)
		if int(player.rotation_degrees) <= -170 and !player.SUPER:
			print("SUPER")
			timer.start()
			player.SUPER = true
