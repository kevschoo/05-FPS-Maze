extends KinematicBody

var target
var space_state
export var speed = 200
func _ready():
	space_state = get_world().direct_space_state

func _on_Area_body_entered(body):
	if body.name == "Player":
		target = body
		print(body.name +"Targeted" )
		$Body.get_surface_material(0).set_albedo(Color(1,0,0))
		$AudioStreamPlayer.play()

func _on_Area_body_exited(body):
	if body.name == "Player":
		target = null
		print(body.name +"Lost" )
		$Body.get_surface_material(0).set_albedo(Color(0,0,0))
		
func _process(delta):
	if target != null:
		var result = space_state.intersect_ray(global_transform.origin, target.global_transform.origin)
		if result.collider == target: 
			look_at(target.global_transform.origin, Vector3.UP)
			move_to_target(delta)

			
func move_to_target(delta):
	var direction = (target.transform.origin - transform.origin).normalized()
	move_and_slide(direction*speed*delta, Vector3.UP)
		


func _on_DamageBox_body_entered(body):
	if body.name == "Player":
		get_tree().change_scene("res://EndMenu/DiedMenu.tscn")
		
