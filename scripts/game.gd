extends Node2D


onready var fruits = get_node("Fruits")

var pineapple = preload("res://scenes/Pineapple.tscn")
var watermelon = preload("res://scenes/Watermelon.tscn")
var pear = preload("res://scenes/Pear.tscn")
var orange = preload("res://scenes/Orange.tscn")
var avocado = preload("res://scenes/Avocado.tscn")
var lemon = preload("res://scenes/Lemon.tscn")
var tomato = preload("res://scenes/Tomato.tscn")
var banana = preload("res://scenes/Banana.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Generator_timeout():
	for i in range(0, rand_range(1, 4)):
		var type = int(rand_range(0, 8))
		var fruit
		match type:
			0: fruit = pineapple.instance()
			1: fruit = watermelon.instance()
			2: fruit = pear.instance()
			3: fruit = orange.instance()
			4: fruit = avocado.instance()
			5: fruit = lemon.instance()
			6: fruit = tomato.instance()
			7: fruit = banana.instance()
			8: print("Bomb!")
			
		fruit.generate(Vector2(rand_range(300, 980), 800))
		fruits.add_child(fruit)
			
