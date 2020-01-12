extends CanvasLayer


	
func updateLives(livesLeft, coins):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(livesLeft)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)