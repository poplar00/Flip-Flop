extends CharacterBody2D

@export var angular = 0.05
@export var speed = 300.0
@export var jump_force = -500.0
var IS_ALIVE : bool = true
var SUPER : bool = false

func _physics_process(delta: float) -> void:
	if !is_on_floor():
		velocity += get_gravity() * delta
	if SUPER:
		speed = 300 * 2
		angular = 0.1
	if position.y > 3000:
		IS_ALIVE = false


func _on_timer_timeout() -> void:
	speed = 300.0
	angular = 0.05 
	SUPER = false
	print("Super off")
