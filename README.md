# Jedi Trials: A Star Wars VR Game

Name: James Clarke & Luke Moss Hughes

Student Number: C20375736 & C20487654

Class Group: TU856, Game Engines 1

Video:
[[!YouTube](https://img.youtube.com/vi/so_m6FLvtvA/hqdefault.jpg)](https://youtu.be/so_m6FLvtvA?si=qfMRXwqMvKNjLBHO)


# 
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

When the enemy is killed, it emits a signal to notify the main scene that an enemy has been killed. The amount of enemies alive is tracked with the enemiesAlive variable. When this variable drops to 0, a new wave will begin, with a greater amount of enemies.

## Custom Sounds
All of the sounds used in this project were sampled from the Star Wars movies and edited by us using the Audacity software to make integration into the game more seamless.

## Player
For player control we used various nodes from XR tools, such as XROrigin. We attached a lightsaber object to the right hand.

## Lightsaber object


## Enemies
The enemies will face the player as the player moves through the level. Each enemy is given a unique random interval that they will fire at. 
When an enemy dies, it instanciates a node at it's own global position that is used to play the enemy death sound and the instance of the enemy scene is removed. A seperate node is used to play the enemy death sound as the enemy node itself is destroyed upon death, meaning that it won't be around to play its own death sound. A lightsaber attack sound effect is played, and an enemy death sound. There is a "standard" enemy death sound, and it has a 1 in 5 chance of playing the infamous "Wilhelm Scream" sound effect.

## Deflection
When the players lightsaber hits an enemy laser bolt, it will return to the center of the enemy who fired it, killing them. When an enemy fires a bolt, the bolt saves a pointer to the enemy object. When it collides with the lightsaber, if the enemy hasn't beeen killed yet it will return to it, otherwise it will simply reverse its direction. When a bullet is deflected, it will play one of two potential sound effects.

##R2D2 Intro
The R2D2 model is a child of the start room scene, this scene stores R2D2's dialogue as an array of strings and programmatically animates the dialogue in a typing fashion with the use of a label3D node and a timer. Each string is seperated with a 3 second delay before the next string is displayed, this delay is governed by another timer. A sound is also played alongside each string that is displayed.

## Environment
We used a hanger model as the main level, which we coloured. Collisions shapes were added to the walls and floors to prevent the player leaving the playspace.
We added a space skybox image, which can be seen through the large hangar view. The beginning R2D2 room was contructed ourselves.

## User Interface
We used two label3D nodes which we attatched the the player camera to display the players current health and the current wave the player is on.


## Notes
The commit message for commit - "e451a6d" was not changed from the prior message as intended. A round system was implemented alongside an incomplete enemy spawning system, changes were also made to scenes.
