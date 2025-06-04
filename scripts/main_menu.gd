extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_game_button_pressed() -> void: 
	
	print("Start pressed");
	
	
	get_tree().change_scene_to_file("res://scenes/lvl1.tscn"); ##changes scene to first level if button is pressed

func _on_quit_game_button_pressed() -> void:
	
	print("Quit pressed"); ##quits game if button is pressed
	get_tree().quit();
