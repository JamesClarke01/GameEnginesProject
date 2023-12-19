extends Node3D

@export var speed = 5.0

var direction
var player
var target

var sender

# Called when the node enters the scene tree for the first time.
func _ready():	
	player = $"../XROrigin3D/XRCamera3D"
	direction = (player.global_position - global_position).normalized()
	look_at(player.global_position, Vector3.UP)
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#linearVelocity = get_node("RigidBody3D").linear_velocity
	destroyIfOutOfBounds()
	pass


func _physics_process(delta):
		
	var v  = speed * direction * delta
			
	global_position += v
	
func returnToSender():
	if sender != null:
		var senderCenter = Vector3(sender.global_position.x, sender.global_position.y + 1.5, sender.global_position.z)
		direction = (senderCenter - global_position).normalized()
		look_at(senderCenter, Vector3.UP)
	else:
		print("Sender doesn't exist")
		direction = -direction
		

func destroyIfOutOfBounds(): 	#Not Working
	#boundaries of scene
	const X_LOW_BOUND = -50
	const X_HIGH_BOUND = 50
	const Y_LOW_BOUND = -50
	const Y_HIGH_BOUND = 50
	const Z_LOW_BOUND = -50
	const Z_HIGH_BOUND = 50
	
	#print("x: ", global_position.x, " y: ", global_position.y, " z: ", global_position.z)
	if (global_position.x < X_LOW_BOUND or
		global_position.x > X_HIGH_BOUND or 
		global_position.y < Y_LOW_BOUND or 
		global_position.y > Y_HIGH_BOUND or 
		global_position.z < Z_LOW_BOUND or 
		global_position.z > Z_HIGH_BOUND):
			#print("Destroy")
			queue_free()	




func _on_area_3d_body_entered(body):
	if body.name == "SaberBlade":
		if randi_range(0, 1) == 1:
			$DeflectSound1.play()
		else:
			$DeflectSound2.play()
		returnToSender()
	elif body == sender:
		sender.kill()
		queue_free()
	else:
		queue_free()
		
