extends Node3D

var R2D2_Speech


# Called when the node enters the scene tree for the first time.
func _ready():
	R2D2_Speech = $Speech
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	R2D2_Speech.text = "Hello There"
