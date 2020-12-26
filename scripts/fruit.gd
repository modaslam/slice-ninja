extends RigidBody2D


onready var shape = get_node("Shape")
onready var sprite0 = get_node("Sprite0")
onready var body1 = get_node("Body1")
onready var body2 = get_node("Body2")
onready var sprite1 = get_node("Body1/Sprite1")
onready var sprite2 = body2.get_node("Sprite2")

var cut = false

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	generate(Vector2(640, 800))


func generate(initialPos):
	position = initialPos
	var initialVel = Vector2(0, rand_range(-1000, -800))
	if initialPos.x < 640:
		initialVel = initialVel.rotated(deg2rad(rand_range(0, -30)))
	else:
		initialVel = initialVel.rotated(deg2rad(rand_range(0, 30)))
	linear_velocity = initialVel
	angular_velocity = rand_range(-10, 10)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
