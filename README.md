# GameEnginesProject
A Star Wars themed game in which the player moves through an environment on a moving platform and uses a lightsaber to deflect blaster beams.

## Description
This is a Star Wars themed game where the player has to fight waves of enemies of increasing size, by deflecting lasers back at them or by slashing them with the lightsaber.

## Wave System
The amount of enemies is determined by the exponential function below:
```
func getEnemiesNum():
	return (round ** 1.3) + 3
```
Enemies are then spawned in gradually at a set interval along an arc of a circle with the following line:
```
enemyInstance.global_position = global_position + Vector3(cos((((PI/2)/enemiesGoal) * enemiesCreated-1) - PI/64) * randi_range(15, 20), 0, sin((((PI/2)/enemiesGoal) * enemiesCreated-1) - PI/64) * randi_range(15, 20))	
```
This line detemines points along the arc of a circle using sin and cos, the arc in radians is split into even pieces according to the number of enemies that will be spawned in a given round, stored in enemiesGoal.
The arc is defined as PI/2, i.e. 45 degrees. this is divided by enemiesGoal, and shifted around the circle by PI/64 to position the enemies in line with the hangars opening.




## Notes
The commit message for commit - "e451a6d" was not changed from the prior message as intended. A round system was implemented alongside an incomplete enemy spawning system, changes were also made to scenes.
