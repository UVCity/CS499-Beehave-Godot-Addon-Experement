extends ConditionLeaf

var safe = false

func tick(_actor , _blackboard):
	print("Is the Tagger nearby ?")

	if safe:
		print("I feel safe ...")
		return RUNNING

	else:
		print("Oh God , it's here !")
