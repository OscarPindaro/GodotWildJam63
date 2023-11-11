extends Area2D
@export var speed = 400
var screen_size
var letter
@onready var sprite = $AnimatedSprite2D
var options = ['K','I','T','E','N','S']
var rand_index:int
# Called when the node enters the scene tree for the first time.
func _ready():

	rand_index = randi() % options.size()
	sprite.animation = options[rand_index]
	letter = options[rand_index]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2()  
	velocity.y += 1 # _on_cat_hitmove vertically
	position += velocity.normalized() * speed


func _on_cat_hit(letter_tile):
	if self == letter_tile:
		hide()
