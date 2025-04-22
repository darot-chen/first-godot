extends Area2D

@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	animation_player.play("died")
	
	var animated_sprite: AnimatedSprite2D = body.get_node("AnimatedSprite2D")
	animated_sprite.play("death")
	
	body.get_node("CollisionShape2D").queue_free()
	
	timer.start()

func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
