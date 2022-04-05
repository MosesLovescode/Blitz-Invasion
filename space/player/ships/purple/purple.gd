extends KinematicBody

const MAXSPEED = 30
const ACCELERATION = 0.75
var inputVector = Vector3()
var velo = Vector3()
var cooldown = 0
const COOLDOWN = 8
var life = 6
onready var guns = [$gun0, $gun1]
onready var main = get_tree().current_scene
var Bullet = load("res://player/objects/bullet.tscn")

func _physics_process(delta):
	seek()
	
	inputVector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	inputVector.y = Input.get_action_strength("ui_up") - Input.get_action_strength("ui_down")
	inputVector = inputVector.normalized()
	velo.x = move_toward(velo.x, inputVector.x * MAXSPEED, ACCELERATION)
	velo.y = move_toward(velo.y, inputVector.y * MAXSPEED, ACCELERATION)
	rotation_degrees.z = velo.x * -2
	rotation_degrees.x = velo.y / 2
	rotation_degrees.y = -velo.x / 2
	move_and_slide(velo)
	transform.origin.x = clamp(transform.origin.x, -15, 15)
	transform.origin.y = clamp(transform.origin.y, -10, 10)
	if life < 6 and life > 4:
		$Control/Sprite3.hide()
	if life >2 and life < 4:
		$Control/Sprite2.hide()
	if life < 2 and life > 0:
		$Control/Sprite.hide()
	if life < 0:
		get_tree().change_scene("res://ui/start.tscn")

	#shooting
	if Input.is_action_pressed("ui_accept") and cooldown <= 0:
		cooldown = COOLDOWN * delta
		for i in guns:
			var bullet = Bullet.instance()
			main.add_child(bullet)
			bullet.transform = i.global_transform
			bullet.velo = bullet.transform.basis.z * -600
			
	#cooldown
	if cooldown > 0:
		cooldown -= delta


func seek():
	if $RayCast.is_colliding():
		$narrowrangeheat/Sprite3D.modulate = Color(255,0,0)
		$widerangeheat/Sprite3D.modulate = Color(255,0,0)
	if !$RayCast.is_colliding():
		$narrowrangeheat/Sprite3D.modulate = Color(225,225,225)
		$widerangeheat/Sprite3D.modulate = Color(225,225,225)


func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		life -= 1
		print("hit life = ",str(life))
		

