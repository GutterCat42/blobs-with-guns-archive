extends RigidBody2D


export(float) var ejectForce = -100.0
export(float) var ejectSpin = 20.0
export(float) var soundVariation = 0.05


func _ready(neg=false):
	if neg:
		apply_central_impulse(Vector2(0, ejectForce).rotated(rotation))
	else:
		apply_central_impulse(Vector2(0, -ejectForce).rotated(rotation))
	add_torque(ejectSpin)


func _on_DEATHTimer_timeout():
	queue_free()


func _on_Shell_body_entered(body):
	if not $PingSound.playing:
		$PingSound.pitch_scale = 1 + rand_range(-soundVariation, soundVariation)
		#$PingSound.play()
