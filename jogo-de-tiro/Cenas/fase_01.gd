extends Node2D

var wave : int
var max_enemies : int
var lives : int

# Called when the node enters the scene tree for the first time.
func _ready():
	wave = 1
	lives = 3
	max_enemies = 10
	$Hud/VidaLabel.text = "X " + str(lives)
	$Hud/OndaLabel.text = "ONDA " + str(wave)
	$Hud/InimigosLabel.text = "X " + str(max_enemies)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_inimigo_spawner_hit_p():
	lives -= 1
	$Hud/VidaLabel.text = "X " + str(lives)
