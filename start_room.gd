extends Node3D

var r2Speech
var textTimer
var phraseTimer
var textIndex
var phraseIndex
var r2Dialogue

# Called when the node enters the scene tree for the first time.
func _ready():
	r2Speech = $Speech
	textTimer = $TextTimer
	phraseTimer = $PhraseTimer
	textIndex = 0
	phraseIndex = 0
	r2Dialogue = ["The last guy that went in there\ndidn't last very long...", "Are you sure you want to do this?", "Well... If you say so.", "Go ahead and hit that lever when you're ready.\nGood luck!"]

	textTimer.start()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_text_timer_timeout():
	if textIndex < len(r2Dialogue[phraseIndex]):
		textIndex += 1
		r2Speech.text = r2Dialogue[phraseIndex].substr(0,textIndex)
	elif phraseIndex < len(r2Dialogue)-1:
		phraseIndex += 1
		textIndex = 0
		textTimer.stop()
		phraseTimer.start()


func _on_phrase_timer_timeout():
	textTimer.start()
	phraseTimer.stop()
