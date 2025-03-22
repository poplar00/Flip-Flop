extends CharacterBody2D

@export var speed = 300.0
@export var jump_force = -800.0
var IS_ALIVE : bool = true

func _physics_process(delta: float) -> void:
	if is_on_floor():
		pass
	else:
		velocity += get_gravity() * delta
	
