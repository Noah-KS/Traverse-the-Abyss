extends CharacterBody2D

@export var speed: int = 45
@onready var animations = $AnimationPlayer
@onready var sprite = $Sprite2D

func handleInput():
	var moveDirection = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = moveDirection*speed

func updateAnimation():
	
	if velocity.length() == 0:
		animations.play("idle")
	
	else: 
		if velocity.x < 0:
			sprite.flip_h =true;
		
		elif velocity.x > 0: 
			sprite.flip_h = false
		
		animations.play("walkRight")
	
	
func _physics_process(delta):
	handleInput()
	move_and_slide()
	updateAnimation()
