extends AnimatedSprite

#podemos usar $".", self o nada para trabajar en este punto.
func _on_Player_animate(motion):
	if motion.y < 0 :
		$".".play("jump")
	elif motion.x > 0 :
		flip_h = false
		self.play("walk")
	elif motion.x < 0 :
		$".".flip_h = true
		self.play("walk")
	else : play("idle")
