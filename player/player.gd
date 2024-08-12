extends CharacterBody2D

@export var speed: int = 35
@onready var animations = $AnimationPlayer
@onready var sprite = $Sprite2D

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

func updateAnimation():
	
	if velocity.length() == 0:
		animations.stop()
		return
		
	var direction = "Down"
	
	if velocity.x < 0:
		direction = "Left" 
		sprite.flip_h = true
		
	elif velocity.x > 0: 
		direction = "Right"
		sprite.flip_h = false
		
	elif velocity.y < 0: direction = "Up"
	
	animations.play("walkRight")
	
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
