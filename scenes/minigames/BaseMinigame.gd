extends Node2D

var announcer_audio_player : AudioStreamPlayer 
var music_audio_player : AudioStreamPlayer
var title_sprite: Sprite2D 
var end_sprite: Sprite2D 
var cum = 0
var start_bar = false
# funzione di start che fa partire tutto quanto
# timer e punteggio
# scritta iniziale
# audio iniziale

# Called when the node enters the scene tree for the first time.
func _ready():
	$MinigameTimer.start()
	announcer_audio_player = $AnnouncerPlayer
	music_audio_player = $MusicStreamPlayer
	title_sprite = $TitleScreen
	end_sprite = $EndSprite
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if start_bar == true:
		cum += delta
		$ProgressBar.value += (100*delta)/$MinigameTimer.wait_time


func _on_announcer_player_finished():
	title_sprite.visible = false
	start_bar = true
	$MinigameTimer.start()
	


func _on_minigame_timer_timeout():
	end_sprite.visible = true

