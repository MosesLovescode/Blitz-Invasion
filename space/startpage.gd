extends Control




func _ready():
	$Button.hide()
	$AnimationPlayer.play("end-sequence")
	yield(get_tree().create_timer(10.0), "timeout")
	$Button.show()




func _on_Button_pressed():
	get_tree().change_scene("res://levels/level1.tscn")
