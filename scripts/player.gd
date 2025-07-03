extends CharacterBody2D


const SPEED = 130.0
const JUMP_VELOCITY = -300.0
const DASH_SPEED = 330.0
var dashing = false
var can_dash = true

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var dash: GPUParticles2D = $DashParticles


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	#check if dashbutton is pressed and if dash cooldown is reset
	if Input.is_action_just_pressed("dash") and can_dash:
		dashing = true
		can_dash = false
		$dash_timer.start()
		$dash_cooldown_timer.start()

	# Get input direction -1, 0 ,1
	var direction = Input.get_axis("move_left", "move_right")
	
	# flip sprite
	if direction > 0:
		animated_sprite.flip_h = false
		
	elif direction < 0:
			animated_sprite.flip_h = true
	dash.scale.x = -1 if direction < 0 else 1 #flips dashparticle shader
			
			
	# play animations
	if is_on_floor():
		if direction == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	else:
		animated_sprite.play("jump")
	
	
	# apply movement
	if direction:
		velocity.x = direction * SPEED
		#applies dashing movement and dash particles
		if dashing:
			velocity.x = direction * DASH_SPEED
			dash.emitting = true
		else:
			velocity.x = direction * SPEED
			dash.emitting = false
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		dash.emitting = false
		

	move_and_slide()

#starts timer so dash doesnt go infinit
func _on_dash_timer_timeout() -> void:
	dashing = false

#cooldown dashtimer
func _on_dash_cooldown_timer_timeout() -> void:
	can_dash = true
#hides dashparticles on startup
func _ready() -> void:
	dash.emitting = false
