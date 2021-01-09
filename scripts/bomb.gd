extends RigidBody2D


onready var shape = get_node("Shape")
onready var sprite = get_node("Sprite")
onready var anim = get_node("Animation")

signal life

var didCut = false


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


func generate(initialPos):
	position = initialPos
	var initialVel = Vector2(0, rand_range(-1000, -800))
	if initialPos.x < 640:
		initialVel = initialVel.rotated(deg2rad(rand_range(0, -30)))
	else:
		initialVel = initialVel.rotated(deg2rad(rand_range(0, 30)))
	linear_velocity = initialVel
	angular_velocity = rand_range(-10, 10)


func cut():
	if didCut: return
	didCut = true
	emit_signal("life")
	# Animation will run but body won't fall
	set_mode(MODE_KINEMATIC)
	anim.play("Explode")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if position.y > 800:
		queue_free()
