# TODO combine with dialogManager

# Alia or other dialog.
extends Area2D

export var allowRepeats = true

onready var dialog_box = preload("res://nodes/managers/DialogManager.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var dia_finished = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Dialog_End():
	#$AnimationPlayer.play("Holo_Close")
	#Global.Player.play_stand_animation(1)
	
	#yield($AnimationPlayer,"animation_finished")
	
	
	MusicPlayer.back_to_stage_music()
	MusicPlayer.start_music(true)
	Global.Player.HasControl = true
	Global.canPause = true
	dia_finished = true

#Item_Dr_light_capsule
func _on_dia1_body_entered(body):
	print("update ", body, body.is_in_group("player"))
	if body != Global.Player:
		return
	# don't repeat dialog
	
	
	if dia_finished == true and not allowRepeats:
		return
		
	#if not body.is_in_group("player"):
	#	return
	
	var dia_box = dialog_box.instance()
	dia_box.DialogPath = "res://JSON/dialog/light_capsules/dia_capsule_foot_part_first.json"
	Global.Current_Hud.add_child(dia_box)
	dia_box.connect("DialogEnded", self, "_on_Dialog_End")
	
	#MusicPlayer.back_to_stage_music()
		
	#MusicPlayer.start_music(true)
	Global.canPause = false
	Global.Player.HasControl = false
	Global.Player.dir = 0

	
	# do dialog
	pass # Replace with function body.
