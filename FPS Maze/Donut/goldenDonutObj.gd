extends Spatial


func _on_Area_body_entered(body):
	if body.name == "Player":
		if Global.donuts >= 5:
			print(body.name +" Collected" )
			Global.donuts +=1 
			queue_free()
			get_tree().change_scene("res://EndMenu/EndMenu.tscn")
