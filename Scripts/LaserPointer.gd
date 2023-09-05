extends RayCast2D


func _physics_process(delta):
	var cast_point := cast_to
	force_raycast_update()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
	
	$Line2D.points[1] = cast_point
	$Line2D.gradient.set_color(1, Color(1, 0, 0, (1 - ($Line2D.points[1].x / cast_to.x))))
	$DotLight.position = cast_point
