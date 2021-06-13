
extends KinematicBody2D

export var speed = 50
export var maxSpeed = 250
export var friction = 0.85

var velocity = Vector2()

func get_input():
	if Input.is_action_pressed("shiftl"):
		maxSpeed = 500
		speed = 100
	else: 
		maxSpeed = 230
		speed = 50
		
	if (!Input.is_action_pressed("right") && !Input.is_action_pressed("left") || Input.is_action_pressed("right") && Input.is_action_pressed("left")):
		velocity.x *= friction
	if Input.is_action_pressed("right"):
		velocity.x += speed
	if Input.is_action_pressed("left"):
		velocity.x -= speed
		
	if (!Input.is_action_pressed("down") && !Input.is_action_pressed("up") || Input.is_action_pressed("down") && Input.is_action_pressed("up")):
		velocity.y *= friction
	if Input.is_action_pressed("down"):
		velocity.y += speed
	if Input.is_action_pressed("up"):
		velocity.y -= speed
	
	if (velocity.x > maxSpeed):
		velocity.x = maxSpeed
	if (velocity.x < -maxSpeed):
		velocity.x = -maxSpeed
		
	if (velocity.y > maxSpeed):
		velocity.y = maxSpeed
	if (velocity.y < -maxSpeed):
		velocity.y = -maxSpeed

func _physics_process(delta):
	get_input()
	velocity = move_and_slide(velocity)
