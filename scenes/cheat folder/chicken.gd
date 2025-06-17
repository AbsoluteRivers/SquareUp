class_name NPC
extends NonPlayableCharacter
#class inheritance


func _ready() -> void:
	walk_cycle = randf_range(min_walk_cycle, max_walk_cycle)
