extends Control


func _ready():
	Global.donuts = 0
	$Goal.text = "Find 5 donuts."
	
func _process(delta):
	$DonutCounter.text = "Donuts: "+ str(Global.donuts)
	if Global.donuts >= 5:
		$Goal.text = "Find the golden donut."
