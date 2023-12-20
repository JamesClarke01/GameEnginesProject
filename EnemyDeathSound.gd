extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$SaberSound.play()
	if randi_range(1, 5) == 5:
		$WilhelmSound.play()
	else:
		$DeathSound.play()
	
	$Timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timer_timeout():
	queue_free()
