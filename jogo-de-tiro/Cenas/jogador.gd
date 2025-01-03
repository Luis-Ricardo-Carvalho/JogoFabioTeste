extends CharacterBody2D

var speed : int
var screen_size : Vector2

func _ready():
	screen_size = get_viewport_rect().size
	position = screen_size /2
	speed = 200

func get_input():
	#teclas do teclado
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir.normalized() * speed

func _physics_process(delta):
	#movimento do Jogador
	get_input()
	move_and_slide()
	
	#parede invisivel do mapa
	position = position.clamp(Vector2.ZERO, screen_size)
	
	#Rotacao do Jogador
	
	var mouse = get_local_mouse_position()
	var angle = snapped(mouse.angle(), PI / 4) / (PI / 4)
	angle = wrapi(int(angle), 0, 8)
	
	$AnimatedSprite2D.animation = "Andar" + str(angle)
	
	#Animacao do Jogador
	if velocity.length() != 0:
		$AnimatedSprite2D.play()
	else: 
		$AnimatedSprite2D.stop()
		$AnimatedSprite2D.frame = 1
#const SPEED = 300


#func _physics_process(delta: float) -> void:

#	var direction := Input.get_vector("left", "right", "up", "down")
#	if direction:
#		velocity.x = direction * SPEED
#	else:
#		velocity.x = move_toward(velocity.x, 0, SPEED)

#	move_and_slide()
