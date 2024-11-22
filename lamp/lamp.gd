extends Sprite2D

@export var lamp_on_tex: AtlasTexture
@export var lamp_off_tex: AtlasTexture

signal lamp_state_changed(state)

var is_lamp_on: bool = true

func toggle_lamp_texture():

    if is_lamp_on == true:
        texture = lamp_off_tex
        is_lamp_on = false
    
    elif is_lamp_on == false: 
        texture = lamp_on_tex
        is_lamp_on = true


func _on_interactable_interacted() -> void:

    toggle_lamp_texture()
    lamp_state_changed.emit(is_lamp_on)

func _ready() -> void:

    lamp_state_changed.emit(is_lamp_on)
