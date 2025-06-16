class_name PlayerCharacter
extends CharacterBody2D

@export var AnimSprite2d: AnimatedSprite2D

@export var SPEED: float = 100.0 #speed of travelling to next tile
@export var grid_size: int = 16 #dimensions of each square in land

var target_area = Vector2.ZERO #where player target destination is
var movement: bool = false #flag check if in motion or not




func _ready() -> void:
	#start target at current location
	target_area = position


func _physics_process(delta: float) -> void:
	if !movement:
		var direction = Vector2.ZERO
		#calls for directions
		if Input.is_action_just_pressed("move_left") && !$left.is_colliding():
			direction = Vector2.LEFT
			AnimSprite2d.play("idle_left")
		elif Input.is_action_just_pressed("move_right") && !$right.is_colliding():
			direction = Vector2.RIGHT
			AnimSprite2d.play("idle_right")
		elif Input.is_action_just_pressed("move_up") && !$up.is_colliding():
			direction = Vector2.UP
		elif Input.is_action_just_pressed("move_down") && !$down.is_colliding():
			direction = Vector2.DOWN
		
		if direction != Vector2.ZERO:
			#update target position based on direction and grid size
			target_area += direction * grid_size
			movement = true
	
	if movement:
		#move the player to the target area
		position = position.move_toward(target_area, SPEED * delta)
		#check if close enough to target to snap and stop
		if position.distance_to(target_area) < SPEED * delta:
			position = target_area
			movement = false
		
		
