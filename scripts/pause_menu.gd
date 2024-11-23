extends Control

func resume():
	get_tree().paused = false
	
	
func pause():
	get_tree().paused = true
	

func testesc():
	
	if Input.is_action_just_pressed("esc") and get_tree().paused == false:
		pause()
		show()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
		hide()
	
func _on_resume_button_pressed() -> void:
	
	pass # Replace with function body.
	resume()
	hide()

func _on_backto_main_button_pressed() -> void:
	pass # Replace with function body.
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	hide()

func _on_restart_button_pressed() -> void:
	pass # Replace with function body.
	resume()
	get_tree().reload_current_scene() 
	
func _ready() -> void:
	hide()
	pass 
	
func _process(delta):
	testesc()
	
