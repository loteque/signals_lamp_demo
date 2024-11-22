extends Area2D
class_name Interactable


@export var valid_group: StringName = "Player"

signal interacted

var can_interact: bool


func _on_body_exited(body:Node2D) -> void:
    
    if body.is_in_group(valid_group):
        can_interact = false


func _on_body_entered(body:Node2D) -> void:
    
    if body.is_in_group(valid_group):
        can_interact = true


func _process(_delta: float) -> void:

    if Input.is_action_just_pressed("interact") and can_interact:
        interacted.emit()
