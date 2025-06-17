extends NodeState


@export var chicken_npc: NonPlayableCharacter
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigation_agent_2d: NavigationAgent2D
@export var min_speed: float = 7.0
@export var max_speed: float = 12.0


var speed: float

func _ready() -> void:
	navigation_agent_2d.velocity_computed.connect(on_safe_velocity_computed)
	
	call_deferred("character_setup")
	#call_deferred method allows to call other functions after the current frame is finished processing
	#will call character_setup function during idle time
	

func character_setup() -> void:
	await get_tree().physics_frame
	#will wait after the first physics frame
	await get_tree().physics_frame
	#to avoid all npc moving to (0,0)
	
	set_movement_target()


func set_movement_target() -> void:
	var target_position: Vector2 = NavigationServer2D.map_get_random_point(navigation_agent_2d.get_navigation_map(), navigation_agent_2d.navigation_layers, false)
	#NavigationServer2D.map_get_random_point(...) is a funtion that returns a random point within a navigation map
	#Parameter 1 gets current navigation map associated with NavigationAgent2D
	#Parameter 2 specifiec which navigation layers are used
	#Parameter 3 indicates if the point must be reachable. false means that the point doesn't need to be verified as reachable by agent
	
	navigation_agent_2d.target_position = target_position
	#sets target position of navigation agent to random point got by target_position
	
	speed = randf_range(min_speed, max_speed)
	#sets default speed value between mix_speed and max_speed
	

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	if navigation_agent_2d.is_navigation_finished():
		chicken_npc.current_walk_cycle += 1
		
		set_movement_target()
		return
		#if statement will find if navigation is finished and will find a different set_movement_target to continue movement
	
	var target_position: Vector2 = navigation_agent_2d.get_next_path_position()
	#print("target direction: ", navigation_agent_2d.target_position)
	#
	var target_direction: Vector2 = chicken_npc.global_position.direction_to(target_position)
	
	#target_direction will get the facing direction of the npc or character
	#animated_sprite_2d.flip_h = target_direction.x < 0
	#will flip the npc or charcter when the target direction is less than 0
	
	var velocity: Vector2 = target_direction * speed
	
	if navigation_agent_2d.avoidance_enabled:
		animated_sprite_2d.flip_h = velocity.x < 0
	#will flip the npc or charcter when the target direction is less than 0
	#used velocity so the sprite doesnt flip mid avoidance
		navigation_agent_2d.velocity = velocity
	else:
		#chicken_npc.velocity = target_direction * speed
		chicken_npc.velocity = velocity
		chicken_npc.move_and_slide()
	
	

func on_safe_velocity_computed(safe_velocity: Vector2) -> void:
	animated_sprite_2d.flip_h = safe_velocity.x < 0
	chicken_npc.velocity = safe_velocity
	chicken_npc.move_and_slide()



func _on_next_transitions() -> void:
	if chicken_npc.current_walk_cycle == chicken_npc.walk_cycle:
		chicken_npc.velocity = Vector2.ZERO
		transition.emit("idle")

func _on_enter() -> void:
	animated_sprite_2d.play("chick_walk_right")
	chicken_npc.current_walk_cycle = 0

func _on_exit() -> void:
	animated_sprite_2d.stop()
	
