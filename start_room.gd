extends Node3D

var r2Speech
var textTimer
var phraseTimer
var textIndex
var phraseIndex
var r2Dialogue
var r2Sound
var opening
var floor

# Called when the node enters the scene tree for the first time.
func _ready():
	r2Speech = $R2D2/Speech
	textTimer = $TextTimer
	phraseTimer = $PhraseTimer
	r2Sound = $R2D2/R2Sound
	floor = $Room/Floor
	textIndex = 0
	phraseIndex = 0
	r2Dialogue = ["The last guy that went in there\ndidn't last very long...", "Are you sure you want to do this?", "Well... If you say so.", "Go ahead and hit that green button\nwhen you're ready.\nGood luck!"]
	opening = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if opening == true and floor.global_position.x > -25:
		floor.global_position.x += 5 * Vector3(1,0,0) * delta;

func _on_text_timer_timeout():
	if textIndex < len(r2Dialogue[phraseIndex]):
		textIndex += 1
		r2Speech.text = r2Dialogue[phraseIndex].substr(0,textIndex)
	elif phraseIndex < len(r2Dialogue)-1:
		phraseIndex += 1
		textIndex = 0
		textTimer.stop()
		phraseTimer.start()
	else:
		textTimer.stop()
		phraseTimer.stop()


func _on_phrase_timer_timeout():
	textTimer.start()
	r2Sound.play()
	phraseTimer.stop()


func _on_button_press_body_entered(body):
	opening = true
	
