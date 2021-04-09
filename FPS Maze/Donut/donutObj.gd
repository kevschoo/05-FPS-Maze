extends Spatial


func _on_Area_body_entered(body):
	if body.name == "Player":
		print(body.name +" Collected" )
		Global.donuts +=1 
		queue_free()
