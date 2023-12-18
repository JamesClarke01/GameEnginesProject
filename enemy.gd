extends RigidBody3D

var timer = null

signal on_enemy_died

func shoot():
	
	var boltScene = load("res://bolt.tscn")
	
	var boltInstance = boltScene.instantiate()
	
	boltInstance.position = $Marker3D.position
	
	add_child(boltInstance)


func startTimer():
	timer = Timer.new()
	add_child(timer)	
	timer.timeout.connect(shoot) #call shoot function when timer expires
	timer.set_wait_time(1.0) #timer every 1 sec
	timer.set_one_shot(false) #loop timer
	timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	startTimer()
	#shoot()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_3d_body_entered(body):
	print("Body entered enemy")
	if body.name == "SaberBlade" or body.name == "Bolt":
		print("saber or bolt entered")
		
		on_enemy_died.emit()
		queue_free()
