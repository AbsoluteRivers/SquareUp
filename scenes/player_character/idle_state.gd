extends NodeState

#@export var player_character: CharacterBody2d
@export var player_character: Player_Character
@export var animated_sprite_2d: AnimatedSprite2D
#used to assign on idle node to respective sprite nodes in inspector

#var state_machine: NodeStateMachine

#var direction: Vector2
#local variable 'direction' removed since player_direction variable is taken from class inheritance Player_Character

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	#direction = GameInputEvent.movement_input()
	#can be removed since we use the class inheritance Player_Character for CharacterBody2d
	
	#if direction == Vector2.UP:
	if player_character.player_direction == Vector2.UP:
		animated_sprite_2d.play("idle_back")
	#elif direction == Vector2.RIGHT:
	elif player_character.player_direction == Vector2.RIGHT:
		animated_sprite_2d.play("idle_right")
	#elif direction == Vector2.DOWN:
	elif player_character.player_direction == Vector2.DOWN:
		animated_sprite_2d.play("idle_front")
	#elif direction == Vector2.LEFT:
	elif player_character.player_direction == Vector2.LEFT:
		animated_sprite_2d.play("idle_left")
	else:
		animated_sprite_2d.play("idle_front")
	#comment ifelse codes before using the class inheritance Player_Character


func _on_next_transitions() -> void:
	GameInputEvent.movement_input()
	#checks if there is movement input
	
	if GameInputEvent.is_movement_input():
		transition.emit("walk")
	#check if returns true of false
	#calls the signal 'transition' from node_state.gd and use the necessary input node as argument
	
	
	#if state_machine.is_ui_active:
		#return
	
	
	if player_character.current_tool == DataTypes.tool_set.AxeWood && GameInputEvent.use_tool():
		transition.emit("chopping")
		
	if player_character.current_tool == DataTypes.tool_set.TillGround && GameInputEvent.use_tool():
		transition.emit("tilling")
		
	if player_character.current_tool == DataTypes.tool_set.WaterCrops && GameInputEvent.use_tool():
		transition.emit("watering")



func _on_enter() -> void:
	pass


func _on_exit() -> void:
	animated_sprite_2d.stop()
	
