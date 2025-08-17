extends StateMachine

enum _states{ #перечисление состояний
	idle, #спокойствие
	run, #бег
	jump, #прыжок
	death, #смерть 
	attack_front, #атака перед собой
	attack_up #атака вверх 
}

@onready var _parent : CharacterBody2D = $".." #ссылка на игрока
@onready var _animation_player : AnimationPlayer = $"../AnimationPlayer" #ссылка на аниматор

func _ready() -> void:
	InitState(_states.idle) #иницализация стартового состояния

func _physics_process(_delta: float) -> void:
	match _current_state: #проверка на текущее состояние
		_states.idle:
			IdleState()
		_states.run:
			RunState()

func IdleState() -> void:
	_animation_player.play("idle")

	if _parent._direction != Vector2.ZERO: #если направление задано - перейти в бег
		StateTransition(_states.idle, _states.run)

func RunState() -> void:
	_animation_player.play("run")

	if _parent._direction == Vector2.ZERO: #если направление НЕ задано - перейти в стояние
		StateTransition(_states.run, _states.idle)

func JumpState() -> void:
	pass

func DeathState() -> void:
	pass

func AttackFrontState() -> void:
	pass

func AttackUpState() -> void:
	pass
