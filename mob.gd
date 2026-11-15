extends Area2D

var mobHP = 10

func attack():
	mobHP -= 1
	print(mobHP)
	if mobHP <= 0:
		Global.Kills += 1
		queue_free()
