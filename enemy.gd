extends RigidBody3D

var timer = null




func shoot():
	print("Shoot")
	var boltScene = load("res://bolt.tscn")
	var boltInstance = boltScene.instantiate()
	
	#boltInstance.linearVelocity.x = 5
	boltInstance.position.z = 0.5
	boltInstance.position.y = 0.5 
	#boltInstance.position.y = 0.5
	
	add_child(boltInstance)
	#boltInstance.Transform.x = 5
	
	
func setupTimer():
	timer = Timer.new()
	add_child(timer)	
	timer.timeout.connect(shoot) #call shoot function when timer expires
	timer.set_wait_time(1.0) #timer every 1 sec
	timer.set_one_shot(false) #loop timer
	timer.start()

# Called when the node enters the scene tree for the first time.
func _ready():
	#setupTimer()
	shoot()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
