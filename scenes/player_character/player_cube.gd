class_name PlayerCharacter
extends CharacterBody2D

@export var AnimSprite2d: AnimatedSprite2D

#var SPEED: float = 100.0
#var ACC = int = 5.0

var currPos = [8.0,8.0]






func _input(event: InputEvent) -> void:
	if event.is_action_pressed("move_right"):
		currPos[0] += 16
		AnimSprite2d.play("idle_right")
	elif event.is_action_pressed("move_left"):
		currPos[0] -= 16
		AnimSprite2d.play("idle_left")
	
	elif event.is_action_pressed("move_down"):
		currPos[1] += 16
	
	elif event.is_action_pressed("move_up"):
		currPos[1] -= 16
	
	
	self.position = Vector2(currPos[0], currPos[1])
	




#func _process(delta: float) -> void:
	#var direction: Vector2
	
	
