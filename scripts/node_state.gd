class_name NodeState
extends Node

@warning_ignore("unused_signal")
signal transition 
#class_name NodeState allows the script to be used as a type elsewhere
#signal transition is used to identify when the state should transition (AnimationNodeTransition property)

func _on_process(_delta : float) -> void:
	pass


func _on_physics_process(_delta : float) -> void:
	pass


func _on_next_transitions() -> void:
	pass


func _on_enter() -> void:
	pass


func _on_exit() -> void:
	pass
	
#all functions are called state lifecycle methods
#empty by default and intended to be overridden by subclasses
#methods are overridden to be used to attach own methods inside
