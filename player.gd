extends CharacterBody2D

# Player movement speed in pixels/sec
@export var movement_speed = 300

@export var sus_if_seen = 20
@export var map_zoom = Vector2.ONE

# Interactable areas the player is in
var interactables = []

# Held item
var held_item = null
var wasPointOfInterest = false

# Base camera zoom
var base_zoom = Vector2.ZERO

@onready var audio_player : AudioStreamPlayer = $AudioStreamPlayer

var was_moving : bool

func _ready():
	# Subscribe to all _hero_entered and _hero_exited signals
	var interactableStuff = get_tree().get_nodes_in_group("interactable")
	for i in range(0, interactableStuff.size()):
		interactableStuff[i]._player_entered.connect(Callable(enter_area))
		interactableStuff[i]._player_exited.connect(Callable(exit_area))
	was_moving = false
	# Get camera zoom
	#base_zoom = $PlayerCamera.zoom

func _process(_delta):
	#print(interactables)
	# Interacting with objects
	if Input.is_action_just_pressed("player_interact") and not interactables.is_empty():
		var validInteractables = interactables.filter(func(x): return not x.is_in_group("item"))
		print(validInteractables)
		if validInteractables.size() > 0:
			validInteractables[0]._player_interact(self)
	
	# Show total map when holding "show_map"
	if Input.is_action_just_pressed("show_map"):
		$PlayerCamera.zoom = map_zoom
	elif Input.is_action_just_released("show_map"):
		$PlayerCamera.zoom = base_zoom

func _physics_process(_delta):
	# Movement
	var direction = Vector2.ZERO
	if Input.is_action_pressed("player_move_up"):
		direction.y += -1
	if Input.is_action_pressed("player_move_down"):
		direction.y += 1
	if Input.is_action_pressed("player_move_right"):
		direction.x += 1
	if Input.is_action_pressed("player_move_left"):
		direction.x += -1
	
	#if Input.is_action_pressed("player_move_up"):
	#	direction.y += -0.3
	#	direction.x += 0.6
	#if Input.is_action_pressed("player_move_down"):
	#	direction.y += 0.3
	#	direction.x += -0.6
	#if Input.is_action_pressed("player_move_right"):
	#	direction.y += 0.3
	#	direction.x += 0.6
	#if Input.is_action_pressed("player_move_left"):
	#	direction.y += -0.3
	#	direction.x += -0.6
	
	if (direction != Vector2.ZERO) and (was_moving == false):
		was_moving = true
		#audio_player.play(audio_player.get_playback_position())
	if direction == Vector2.ZERO:
		was_moving = false
		#audio_player.stop()
	
	var target_velocity = direction.normalized() * movement_speed
	velocity = target_velocity
	move_and_slide()

	# Animations
	var sprite = $AnimatedSprite
	if target_velocity == Vector2.ZERO:
		sprite.animation = "idle"
	elif target_velocity.x > 0:
		sprite.animation = "move_horizontal"
		sprite.flip_h = false;
	elif target_velocity.x < 0:
		sprite.animation = "move_horizontal"
		sprite.flip_h = true;
	elif target_velocity.y > 0:
		sprite.animation = "move_down"
		sprite.flip_h = false;
	else:
		sprite.animation = "move_up"
		sprite.flip_h = false;
	sprite.play()

#func grab_item(item):
#	if held_item != null:
#		drop_item()
#	# Grab item
#	item.find_child("Area").remove_from_group("point_of_interest")
#	var exParent = item.get_parent()
#	exParent.remove_child(item);
#	$ItemAnchor.add_child(item)
#	item.position = Vector2.ZERO
#	held_item = item
#
#	# Remove the relative interactable from list
#	interactables.erase(item)
#
#func drop_item():
#	# Drop item at this position
#	held_item.find_child("Area").add_to_group("point_of_interest")
#	held_item.get_parent().remove_child(held_item);
#	get_parent().add_child(held_item)
#	held_item.global_position = global_position;
#	held_item = null;

#func seen(hero):
#	hero.gain_sus(sus_if_seen, true)

#func get_held_item():
#	return held_item;

func enter_area(area):
	if area.is_in_group("interactable"):
		interactables.push_front(area)

func exit_area(area):
	interactables.erase(area)
	
func connect_runtime_interactable(interactable):
	interactable._player_entered.connect(Callable(enter_area))
	interactable._player_exited.connect(Callable(exit_area))

