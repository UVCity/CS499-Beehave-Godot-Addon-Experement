extends ConditionLeaf

func tick(_runner , _blackboard):
	var runners: Array[Node] = _blackboard.get_value("runners")
	var hunter : Node = _blackboard.get_value("hunter")
	
	#print(_runner.name, " says that they are a runner")

	if !runners.has(_runner):
		#print("adding ", _runner.name, " to the runners")
		runners.append(_runner)
		_blackboard.set_value("runners", runners)
		return RUNNING

	else:
		if hunter_is_nearby():
			print(_runner.name," Is running from ", hunter.name )
			return SUCCESS

		#print(_runner.name," feels safe , hiding from ", hunter.name )		
		return FAILURE

# to restart tick return RUNNING
# to move to Runner return SUCCESS
# to move to IsItNear return FAILURE

func hunter_is_nearby():
	return true
