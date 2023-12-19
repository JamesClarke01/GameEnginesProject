extends RigidBody3D

var timer = null
var player

const BOLT_TYPE = 24
const SABER_TYPE = 3

signal on_enemy_died

func shoot():
	
	var boltScene = load("res://bolt.tscn")
	
	var boltInstance = boltScene.instantiate()
	
	boltInstance.global_position = $Marker3D.global_position
	
	boltInstance.sender = self
	
	#Make a child of Main
	get_parent().add_child(boltInstance)


func startTimer():
	var time = randi_range(5, 10)
	timer = Timer.new()
	add_child(timer)	
	timer.timeout.connect(shoot) #call shoot function when timer expires
	timer.set_wait_time(time) #timer every 1 sec
	timer.set_one_shot(false) #loop timer
	timer.start()

"""
func lookAtPlayer():
	# Calculate the direction vector
	var direction = (player.global_transform.origin - global_transform.origin).normalized()

	# Calculate the rotation angle around the Y-axis
	var angle = atan2(direction.x, direction.z)

	# Create a quaternion for the Y-axis rotation
	var rotation_quat = Quaternion(Vector3(0, 1, 0), angle)

	var rotated_x = rotation_quat.x
	var rotated_z = rotation_quat.z

	global_transform.basis.x = Vector3(rotated_x.x, rotated_x.y, rotated_x.z)
	global_transform.basis.z = Vector3(rotated_z.x, rotated_z.y, rotated_z.z)
"""

func lookAtPlayer():
	var target = player.global_position
	target.y = 0
	look_at(target, Vector3.UP)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	player = $"../XROrigin3D"
	#look_at(player.global_position, Vector3.UP)
	lookAtPlayer()
	startTimer()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#look_at(player.global_position, Vector3.UP)
	lookAtPlayer()
	position.y = 0
	
	

func kill():
	on_enemy_died.emit()
	queue_free()
	


func _on_area_3d_body_entered(body):
	print("Body entered enemy")	
	if body.name == "SaberBlade": # or typeof(body) == BOLT_TYPE
		print("saber or bolt entered")
		
		on_enemy_died.emit()
		queue_free()
