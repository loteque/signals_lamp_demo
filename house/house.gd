extends Sprite2D

@export var valid_group: StringName = "Player"
@export var int_light_texture: AtlasTexture
@export var int_dark_texture: AtlasTexture
@export var ext_light_texture: AtlasTexture
@export var ext_dark_texture: AtlasTexture

var is_light_on: bool
var is_player_in_house: bool

func update_texture(new_texture):

    texture = new_texture


func _on_lamp_lamp_state_changed(state:Variant) -> void:
	
    if state:
        update_texture(int_light_texture)
        is_light_on = true
    else:
        update_texture(int_dark_texture)
        is_light_on = false


func _on_area_2d_body_entered(body:Node2D) -> void:

    if !body.is_in_group(valid_group):
        return

    is_player_in_house = true
    $Props.show()

    if is_light_on:
        update_texture(int_light_texture)
    else:
        update_texture(int_dark_texture)


func _on_area_2d_body_exited(body:Node2D) -> void:
	
    if !body.is_in_group(valid_group):
        return

    is_player_in_house = false
    $Props.hide()

    if is_light_on:
        update_texture(ext_light_texture)
    else:
        update_texture(ext_dark_texture)

    
func _ready() -> void:

    if is_player_in_house:
        $Props.show()
        if is_light_on:
            update_texture(int_light_texture)
            
        else:
            update_texture(int_dark_texture)
    else:
        $Props.hide()
        if is_light_on:
            update_texture(ext_light_texture)
        else: 
            update_texture(ext_dark_texture)
