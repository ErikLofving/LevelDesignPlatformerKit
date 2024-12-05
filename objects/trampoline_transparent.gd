extends Node3D
@export var trampoline_strength : float = 10
@onready var trampoline_audio_stream_player_3d: AudioStreamPlayer3D = $TrampolineAudioStreamPlayer3D
@onready var trampoline_animation_player: AnimationPlayer = $TrampolineAnimationPlayer


@onready var block_moving_large = $"block-moving-large"

@onready var area_3d = $"block-moving-large/Area3D"



func _on_area_3d_body_entered(body: Node3D) -> void:
	if body.has_method("bounce_player"):
		body.bounce_player(trampoline_strength)
		trampoline_audio_stream_player_3d.play()
		trampoline_animation_player.play("bounce")
