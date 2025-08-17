extends Node
class_name StateMachine #название родительского узла

var _current_state #текущее состояние

func InitState(_init_state): #иницализация стартового состояния
	_current_state = _init_state

func StateTransition(_old_state, _new_state): #переход из одного состояния в другое 
	if _new_state != _old_state:
		_current_state = _new_state
