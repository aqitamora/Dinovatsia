extends CharacterBody2D

var _direction : Vector2 = Vector2.ZERO #направление

var _speed : float = 40.0 #скорость
@onready var _accel : float = _speed / 10.0 #ускорение

@onready var _sprite : Sprite2D = $MainSprite

func _physics_process(delta: float) -> void:
	GetInput()

	velocity.x = lerp(velocity.x, _direction.x * _speed, _accel * delta) #придание скорости
	move_and_slide()

func GetInput() -> void :
	_direction.x = Input.get_axis("player_left","player_right") #ввод направления с клавиатуры

	if _direction.x > 0: #проверка и поворот спрайта в сторону движения
		_sprite.flip_h = false
	elif _direction.x < 0:
		_sprite.flip_h = true
