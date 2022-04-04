extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("opening sequence")
	yield(get_tree().create_timer(30.0), "timeout")
	get_tree().change_scene("res://levels/level1.tscn")
