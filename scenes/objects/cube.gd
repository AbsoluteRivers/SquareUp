class_name CubeObject
extends CharacterBody2D

@onready var touch_move: TouchMoveComponent = $TouchMoveComponent
@onready var player_character: PlayerCharacter #Node = get_node_or_null("/root/PlayerCube")

func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if touch_move:
		if Input.is_action_just_pressed("move_left"):
			direction = Vector2.LEFT
		elif Input.is_action_just_pressed("move_right"):
			direction = Vector2.RIGHT
		elif Input.is_action_just_pressed("move_up"):
			direction = Vector2.UP
		elif Input.is_action_just_pressed("move_down"):
			direction = Vector2.DOWN
		
		else:
			direction = Vector2.ZERO
