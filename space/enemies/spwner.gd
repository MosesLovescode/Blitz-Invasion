extends Spatial

onready var main = get_tree().current_scene
var Enemy = load("res://enemies/enemy002.tscn")
var Enemy2 = load("res://enemies/enemy001.tscn")
var gold = load("res://player/objects/gold.tscn")
var gem = load("res://player/objects/gem.tscn")
func spawn():
	var enemy = Enemy.instance()
	main.add_child(enemy)
	enemy.transform.origin = transform.origin + Vector3(rand_range(-15,15), rand_range(-10,10), 0)

func spawn2():
	var enemy = Enemy2.instance()
	main.add_child(enemy)
	enemy.transform.origin = transform.origin + Vector3(rand_range(-15,15), rand_range(-10,10), 0)

func spawn3():
	var coin = gold.instance()
	main.add_child(coin)
	coin.transform.origin = transform.origin + Vector3(rand_range(-15,15), rand_range(-10,10), 0)

func spawn4():
	var coin = gem.instance()
	main.add_child(coin)
	coin.transform.origin = transform.origin + Vector3(rand_range(-15,15), rand_range(-10,10), 0)
	
func _on_Timer_timeout():
	spawn()


func _on_Timer2_timeout():
	spawn2()


func _on_Timer3_timeout():
	spawn3()


func _on_Timer4_timeout():
	spawn4()
