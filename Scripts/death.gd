extends state

@onready var player : CharacterBody2D = get_parent().get_parent()

func Enter():
	get_tree().reload_current_scene()
	
func Exit():
	pass
	
func Update(_delta:float):
	pass
func Physic_Update(_delat:float):
	pass
		
