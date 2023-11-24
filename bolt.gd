extends Node3D

@export var speed = 5.0



# Called when the node enters the scene tree for the first time.
func _ready():	
	
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#linearVelocity = get_node("RigidBody3D").linear_velocity
	destroyIfOutOfBounds()
	pass




func _physics_process(delta):
	# Local space forward
	
	var target = $"../Target"
	#print(target.position)
	#var forward = (target.position - position).normalized()
	var forward = Vector3.BACK	
	var v  = speed * forward * delta		
	
	# Transform to world space by multiplying by
	#var q = global_transform.basis.get_rotation_quaternion() 
	#v = q * v
	
	global_position += v
	




func destroyIfOutOfBounds(): 	#Not Working
	#boundaries of scene
	const X_LOW_BOUND = -50
	const X_HIGH_BOUND = 50
	const Y_LOW_BOUND = 0
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
			print("Destroy")
			queue_free()	

"""
func _on_rigid_body_3d_body_entered(body):
	print("Body entered")	
"""
