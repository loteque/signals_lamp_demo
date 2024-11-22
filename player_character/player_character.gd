extends CharacterBody2D

@export var speed = 300


func move():
    
    var input = Input.get_vector("left", "right", "up", "down").normalized()
    velocity = speed * input
    move_and_slide()


func _process(_delta: float) -> void:
    
    move()