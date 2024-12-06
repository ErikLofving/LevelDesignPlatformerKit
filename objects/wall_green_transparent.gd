extends Node3D

@onready var playerCharacter : Node3D = get_tree().get_first_node_in_group("PlayerGroup")

@export var opacity : float = 0.5

@onready var platform_2 = $cube2

@onready var animation_player = $AnimationPlayer

var transparencyChange : float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_area_3d_body_entered(body):
	if body == playerCharacter:
		
		animation_player.play("Transparent")
		print("player has entered the area!")
		
	pass # Replace with function body.

func _on_area_3d_body_exited(body):
	if body == playerCharacter:
		
		animation_player.play("Opacity")
		print("player has entered the area!")
	
	pass # Replace with function body.
