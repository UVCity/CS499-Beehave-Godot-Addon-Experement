extends ConditionLeaf

func tick(_actor , _blackboard):
	
	if !_blackboard.get_value("tagged"):
		print("Have not tagged anyone")
		_blackboard.set_value("tagged", true)
		return RUNNING
	
	else:
		print("nvm found someone")
		return FAILURE
