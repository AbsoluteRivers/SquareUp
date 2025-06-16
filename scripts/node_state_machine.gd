class_name NodeStateMachine
extends Node



@export var initial_node_state : NodeState
#holds very first node
#assigned in the inspector tab the "idle" or the initial node

#@onready var tool_panel_ui : ToolBox = get_tree().root.get_node("")

var node_states : Dictionary = {}
#hold the other state nodes
var current_node_state : NodeState
#current node running
var current_node_state_name : String
var parent_node_name: String


func _ready() -> void:
	parent_node_name = get_parent().name
	
	for child in get_children():
		#children of state machine node will be held in array below
		if child is NodeState:
			node_states[child.name.to_lower()] = child
			child.transition.connect(transition_to)
			#.transition property is part of the AnimationNodeTransition class allowing for state transitions
			#.connect() method is uswed to link signals to other methods like transition_to to eneble event-driven behavior
			#transition_to is a function called by .connect
	
	if initial_node_state:
		#if statement is part of _ready() function
		initial_node_state._on_enter()
		#when initial_node_state starts, ._on_enter() function from node_state.gd enters 
		#starts the first state by calling ._on_enter()
		current_node_state = initial_node_state
		current_node_state_name = current_node_state.name.to_lower()
	
	#tool_panel_ui.connect("is_mouse_over_ui", Callable( self, "_on_tool_panel_mouse_active"))
	#Callable(self, "method_name") tells godot to call method on self when the signal fires


func _process(delta : float) -> void:
	if current_node_state:
		current_node_state._on_process(delta)


func _physics_process(delta: float) -> void:
	if current_node_state:
		current_node_state._on_physics_process(delta)
		current_node_state._on_next_transitions()
		#print(parent_node_name, " Current State: ", current_node_state_name)
#_process and _physics_process both fall under frame update methods
#forwards the process and physics updates to the current state
#calls ._on_next_transitions function from node_state.gd to check if a state switch is needed

func transition_to(node_state_name : String) -> void:
	if node_state_name == current_node_state.name.to_lower():
		return
	
	var new_node_state = node_states.get(node_state_name.to_lower())
	
	if !new_node_state:
		return
		#means that if it is not a new_node_state, it returns the function / will end the function
	
	if current_node_state:
		current_node_state._on_exit()
		#if the node state is current_node_state, function will call external ._on_exit() function from node_state.gd
		#calls the ._on_exit() on current state
	new_node_state._on_enter()
	#calls ._on_enter() on a new state
	#updates the reference to the current state
	
	current_node_state = new_node_state
	current_node_state_name = current_node_state.name.to_lower()
	#print("Current State: ", current_node_state_name)
#transition_to function enables node to transition from one node to the next / state switching
#allows node to tranition from one state to next




	
	
	
#var is_ui_active: bool = false

#func _on_tool_panel_mouse_active(active: bool) -> void:
	#is_ui_active = active
