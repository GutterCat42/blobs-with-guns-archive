extends RigidBody2D


export(PackedScene) var Explosion = preload("res://Scenes/Explosion.tscn")
export(float) var throttle = 0
export(float) var max_rpm = 30
export(float) var hp = 50


func get_hit(damage=1, sprayAngle=0, offset=Vector2.ZERO, tricks=[], multikill=1):
	hp -= damage
	if hp < 0:
		var e = Explosion.instance()
		get_parent().add_child(e)
		e.global_transform = global_transform
		queue_free()


func _physics_process(delta):
	if $Wheel.get_angular_velocity() <= max_rpm:
		$Wheel.add_torque(throttle)
	if $Wheel2.get_angular_velocity() <= max_rpm:
		$Wheel2.add_torque(throttle)
