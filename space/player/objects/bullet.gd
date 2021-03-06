extends KinematicBody

var velo = Vector3()
var KillParticles = load("res://player/objects/KillParticles.tscn")
onready var main = get_tree().current_scene
#onready var explodeSound = $EnemyExplode

func _physics_process(delta):
	move_and_slide(velo)

func _on_Area_body_entered(body):
	if body.is_in_group("Enemies"):
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		body.queue_free()
		#explodeSound.play()
		visible = false
		$Area/CollisionShape.disabled = true
		queue_free()
	if body.is_in_group("Gold"):
		var particles = KillParticles.instance()
		main.add_child(particles)
		particles.transform.origin = transform.origin
		body.queue_free()
		#explodeSound.play()
		visible = false
		$Area/CollisionShape.disabled = true
		queue_free()

func _on_Timer_timeout():
	queue_free()
