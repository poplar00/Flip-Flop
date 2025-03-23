extends CanvasLayer


func _ready() -> void:
	self.hide()

func _on_button_pressed() -> void:
	get_tree().reload_current_scene()

func gameover():
	await get_tree().create_timer(1).timeout
	self.show()
