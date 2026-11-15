extends CharacterBody2D

var boinginess = 0
var input_direction = Input.get_vector("key_left","key_right", "key_up", "key_down")
var prev_move = 0

func _process(delta: float) -> void:
	
	if boinginess == 0:
		input_direction = Input.get_vector("key_left","key_right", "key_up", "key_down")
	
	if boinginess != 1:
		prev_move = input_direction
		
	if boinginess == 1:
		input_direction = -1.2*prev_move
		await get_tree().create_timer(.25).timeout
		boinginess = 0
	
	
		
var bounces = 0
func _physics_process(delta: float) -> void:
	velocity = input_direction*600
	move_and_slide()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("Mob"):
		boinginess = 1
		area.attack()
	
	elif area.is_in_group("leave"):
		if Global.scene == 1:
			Global.Kills = 0
			if bounces >= 3:
				Global.scene = 2
				get_tree().change_scene_to_file("res://Scene 2.tscn")
		elif Global.scene == 2:
			print(Global.Kills)
			
			if Global.Kills == 8:
				Global.Kills = 0
				Global.scene = 3
				get_tree().change_scene_to_file("res://Scene 3.tscn")	
		
		elif Global.scene == 3:
			if Global.Kills == 6:
				Global.scene = 4
				Global.Kills = 0
				get_tree().change_scene_to_file("res://Scene 4.tscn")
		else:
			boinginess = 1
	
	else:
		boinginess = 1
		bounces += 1
		
		
