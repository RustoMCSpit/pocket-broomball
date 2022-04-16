extends Node2D

signal freeze

var animation_player

func _ready():
	animation_player = $AnimationPlayer
	animation_player.play("Spawn")
	$Duration.start()

func _on_Area2D_body_entered(body):
	emit_signal("freeze")
	animation_player.play("Hit")
	yield(animation_player,"animation_finished")
	queue_free()


func _on_Duration_timeout():
	animation_player.play("Hit")
	yield(animation_player,"animation_finished")
	queue_free()
