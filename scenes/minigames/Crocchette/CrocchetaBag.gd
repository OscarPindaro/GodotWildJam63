extends Area2D

var mouse_inside : bool = false
var mouse_active: bool = false

@export var crocchetta_scene: PackedScene
@export var force_intensity :int = 30
@export var min_delta_position : int = 5

@onready var shake_player : AudioStreamPlayer = $AudioStreamPlayer
var audio_files = []


var rng = RandomNumberGenerator.new()

var old_position: Vector2 = Vector2.ZERO

var can_shoot : bool = true

@export var is_scene_active : bool = false

@export var MAX_CROCS : int = 10


# Called when the node enters the scene tree for the first time.
func _ready():
	audio_files.append(preload("res://audio/Shake_treats/Shaking_Treats2.wav"))
	audio_files.append(preload("res://audio/Shake_treats/Shaking_Treats3.wav"))
	audio_files.append(preload("res://audio/Shake_treats/Shaking_Treats4.wav"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if is_scene_active:
		# Mouse in viewport coordinates.
		if event is InputEventMouseButton:
			# print("Mouse Click/Unclick at: ", event.position)
			if event.pressed and mouse_inside:
				mouse_active = true
				_on_audio_stream_player_finished()
			else:
				mouse_active = false
				shake_player.stop()
	

func _process(delta):
	if is_scene_active:
		if mouse_active:
			position = get_viewport().get_mouse_position()
			var direction = (position - old_position).normalized()
			
			if can_shoot and (position - old_position).length() > min_delta_position:
				can_shoot = false
				$CrocTimer.start()
				var n_crocs = rng.randi_range(2,MAX_CROCS)
				for i in range(n_crocs):
					var croc: RigidBody2D = crocchetta_scene.instantiate()
					$Crocs.add_child(croc)
					var random_noise_x = 0
					var random_noise_y = 0
					croc.global_position = $SpawnPoint.global_position + Vector2(rng.randfn(10, 30),rng.randfn(10, 30))
					var modified_direction = direction.rotated(rng.randf_range(-PI/6, PI/6))
					# croc.add_constant_force(direction*force_intensity, croc.global_position)
					croc.apply_central_impulse(modified_direction*force_intensity)
					croc.apply_torque_impulse(rng.randf_range(-100,100))
	old_position = position

	

func _on_mouse_entered():
	mouse_inside = true


func _on_mouse_exited():
	mouse_inside = false


func _on_croc_timer_timeout():
	can_shoot = true


func _on_minigame_timer_timeout():
	is_scene_active = false


func _on_announcer_player_finished():
	is_scene_active = true


func _on_audio_stream_player_finished():
	var rng = RandomNumberGenerator.new()
	rng.randomize()
	shake_player.stream = audio_files[rng.randi_range(0,audio_files.size())-1]
	shake_player.play()
