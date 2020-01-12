extends Node2D

var lives = 1
var coins = 0
var extraLifeCoins = 10

func _ready():
	add_to_group("Gamestate")
	updateGUI()

func hurt():	
	lives -= 1
	$Player.hurt()
	updateGUI()
	if lives < 0 :
		endGame()

func addCoin():	
	coins += 1
	var lifeGranted = (coins % extraLifeCoins) == 0
	if(lifeGranted) :
		lifeUp()
	updateGUI()

func lifeUp():
	lives += 1
	updateGUI()
	
func updateGUI():
	get_tree().call_group("GUI", "updateLives", lives, coins)

func endGame():
	get_tree().change_scene("res://Levels/GameOver.tscn")
	
func winGame():
	get_tree().change_scene("res://Levels/Victory.tscn")