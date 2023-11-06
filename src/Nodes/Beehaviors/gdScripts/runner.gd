extends ActionLeaf

var caught = true

func tick(_actor , _blackboard):
	
	if !_blackboard.get_value("caught"):
		print("Ive been caught !")
		_blackboard.set_value("caught", true)
	
	else:
		print("r u n")
		return RUNNING
