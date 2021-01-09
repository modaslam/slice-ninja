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

var bomb = preload("res://scenes/Bomb.tscn")

var score = 0
var lives = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Generator_timeout():
	if lives <=0 : return
	for i in range(0, rand_range(1, 4)):
		var type = int(rand_range(0, 9))
		var obj
		match type:
			0: obj = pineapple.instance()
			1: obj = watermelon.instance()
			2: obj = pear.instance()
			3: obj = orange.instance()
			4: obj = avocado.instance()
			5: obj = lemon.instance()
			6: obj = tomato.instance()
			7: obj = banana.instance()
			8: obj = bomb.instance()
			
		obj.generate(Vector2(rand_range(300, 980), 800))
		
		obj.connect("life", self, "dec_life")
		
		if type != 8:
			obj.connect("score", self, "inc_score")
		
		fruits.add_child(obj)
		
		


func dec_life():
	lives -= 1
	
	if lives == 2:
		get_node("Control/Bomb3").set_modulate(Color(1, 0 ,0))
	elif lives == 1:
		get_node("Control/Bomb2").set_modulate(Color(1, 0 ,0))
	elif lives == 0:
		get_node("Control/Bomb1").set_modulate(Color(1, 0 ,0))
		get_node("InputProcessor").gameOver = true
		get_node("GameOverScreen").start()


func inc_score():
	if lives == 0: return
	score += 1
	get_node("Control/Label").set_text(str(score))
