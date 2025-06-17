class_name TouchMoveComponent
extends Area2D

signal touch

@onready var player_character: PlayerCharacter 
@onready var win_stage: WinStageComponent



func _on_body_entered(body: Node2D) -> void:
	var player_cube = get_tree().get_first_node_in_group("player")
	print("in zone")
	emit_signal("touch")
	for obj in get_overlapping_bodies():
		if obj == player_character:
			print("yey, ok go back")
		
		#var player_direction = Vector2.ZERO
		#if player_character.input_event.connect()
	#var target_direction: Vector2 = 
	#if player_character.direction == Vector2.UP:
		#self.direction = Vector2.UP
