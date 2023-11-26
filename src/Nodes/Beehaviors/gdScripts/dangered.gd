extends ConditionLeaf

func tick(_runner , _blackboard):
	var runners : String = _blackboard.get_value("runners")
	var hunter : String = _blackboard.get_value("hunter")

	if !runners.contains(_runner.name):
		runners = runners + " " + _runner.name
		_blackboard.set_value("runners", runners)
		return RUNNING

	else:
		if hunter_is_nearby():
			print(_runner.name," Is running from ", hunter )
			return SUCCESS

		print(_runner.name," feels safe , hiding from ", hunter )		
		return FAILURE

# to restart tick return RUNNING
# to move to Runner return SUCCESS
# to move to IsItNear return FAILURE

func hunter_is_nearby():
	return true
