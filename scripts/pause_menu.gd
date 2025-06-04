extends Control

func resume(): ##unpauses game
	get_tree().paused = false
	
	
func pause(): ##pauses game
	get_tree().paused = true
	

func testesc(): ##checks if esc as been pressed and if game is already paused or not
	
	if Input.is_action_just_pressed("esc") and get_tree().paused == false: 
		pause()
		show()
	elif Input.is_action_just_pressed("esc") and get_tree().paused == true:
		resume()
		hide()
	
func _on_resume_button_pressed() -> void: ##resume button 
	
	
	resume()
	hide()

func _on_backto_main_button_pressed() -> void: ##changes scene to mainmenu scene
	
	resume()
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	hide()

func _on_restart_button_pressed() -> void:
	
	resume()
	get_tree().reload_current_scene() ##reloads current scene
	
func _ready() -> void:
	hide() #hides pause menu at start of scene
	
	
func _process(delta):
	testesc() ##constanly runs through escfunction 
	
