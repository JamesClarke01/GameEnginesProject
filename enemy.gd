extends RigidBody3D

var timer = null

#var mainScene = load("res://bolt.tscn")

func shoot():
	print("Shoot")
	var boltScene = load("res://bolt.tscn")
	
	var boltInstance = boltScene.instantiate()

	boltInstance.position = $Marker3D.global_position
	print("enemy position: " + str(global_position) + " | marker position: " + str($Marker3D.global_position))
	
	get_parent().add_child(boltInstance)
	
	#boltInstance.Transform.x = 5

	
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
