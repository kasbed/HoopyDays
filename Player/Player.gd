extends KinematicBody2D

var motion = Vector2(0,0)

const SPEED = 1500
const GRAVITY = 150
const UP = Vector2(0,-1)
const JUMPSPEED = 3000
const WORLD_LIMIT = 3000
const BOOSTMULTIPLIER = 2

signal animate

#move_and_collide() nos movemos y si chocamos con algo nos detenemos
#move_and_slide() nos movemos y intentamos atravesar con lo que nos choquemos
func _physics_process(delta):	
	applyGravity()
	jump()
	move()
	animate()
	move_and_slide(motion, UP)	

func applyGravity():
	if position.y > WORLD_LIMIT:
		get_tree().call_group("Gamestate", "endGame")
	if is_on_floor() && motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else: 
		motion.y += GRAVITY  
		
func jump():
	if Input.is_action_pressed("jump") and is_on_floor(): 
		motion.y -=JUMPSPEED		
		$JumpSFX.play()
	
func move():
	if Input.is_action_pressed("left") && !Input.is_action_pressed("right"):motion.x = -SPEED
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"): motion.x = SPEED
	else: motion.x = 0

func animate():
	emit_signal("animate", motion)	
	
func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -JUMPSPEED
	$HurtSFX.play()
	
func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	$JumpSFX.play()
	motion.y = -JUMPSPEED * BOOSTMULTIPLIER