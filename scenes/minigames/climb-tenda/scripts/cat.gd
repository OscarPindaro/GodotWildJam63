extends Area2D
signal hit

var points = 0
var num_frames
var pressed_key
var collision_list = []
var letter_list = []
var audioFiles_climb = []
var audioFiles_angry = []
var current_frame = 0
@onready var audio_node_climb = $cat_climbing
@onready var audio_node_angry = $cat_angry
@onready var good_job = $good_job
@onready var sprite = $AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	audioFiles_climb.append(preload("res://audio/Climb_Curtains/Climbing_sound1.wav"))
	audioFiles_climb.append(preload("res://audio/Climb_Curtains/Climbing_sound2.wav"))
	audioFiles_climb.append(preload("res://audio/Climb_Curtains/Climbing_sound3.wav"))
	audioFiles_climb.append(preload("res://audio/Climb_Curtains/Climbing_sound4.wav"))
	audioFiles_climb.append(preload("res://audio/Climb_Curtains/Climbing_sound5.wav"))
	
	audioFiles_angry.append(preload("res://audio/Cat_Sounds/Angry_Cat.wav"))
	audioFiles_angry.append(preload("res://audio/Cat_Sounds/Cat_Hiss1.wav"))
	audioFiles_angry.append(preload("res://audio/Cat_Sounds/Cat_Hiss2.wav"))
	sprite.animation = "default"
	

func _input(event):
	if event is InputEventKey and event.pressed:
		pressed_key = event.as_text_keycode()
		move_foreward()
		if pressed_key in letter_list:
			print('bella mossa fratello')
			play_sound(audioFiles_climb, audio_node_climb)
			good_job.play()
			points += 10
			hit_letter(pressed_key)
			cleanup(pressed_key)

		else:
			print('coglione')
			play_sound(audioFiles_angry, audio_node_angry)
			points -= 5
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	if area.is_in_group("letterGroup"):
		collision_list.append(area)
		letter_list.append(area.letter)
	pass # Replace with function body.


func _on_area_exited(area):
	if area.is_in_group("letterGroup"):
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
			
func play_sound(audioFiles, audio_node):	
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	audio_node.stream = audioFiles[rng.randi_range(0,audioFiles.size())-1]
	audio_node.play()
	
