extends Area2D
signal hit
signal scored

var num_frames
var pressed_key
var collision_list = []
var letter_list = []
var current_frame = 0
@onready var sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.animation = "default"
	pass

func _input(event):
	if event is InputEventKey and event.pressed:
		pressed_key = event.as_text_keycode()
		move_foreward()
		if pressed_key in letter_list:
			print('bella mossa fratello')
			hit_letter(pressed_key)
			cleanup(pressed_key)

		else:
			print('coglione')
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	collision_list.append(area)
	letter_list.append(area.letter)
	pass # Replace with function body.


func _on_area_exited(area):
	collision_list.erase(area.get_name())
	letter_list.erase(area.letter)
	pass # Replace with function body.
	
	
func move_foreward():
	if sprite.animation == 'dxPaw' or sprite.animation == 'default':	
		sprite.animation = 'sxPaw'

	else:
		sprite.animation = 'dxPaw'
	
func cleanup(pressed_key):
	letter_list.erase(pressed_key)
	for letter_tile in collision_list:
		if letter_tile.letter == pressed_key:
			collision_list.erase(letter_tile)

func hit_letter(letter):
	for letter_tile in collision_list:
		if letter_tile.letter == letter:
			emit_signal('hit', letter_tile)
			
