# Jedi Trials: A Star Wars VR Game

Name: James Clarke & Luke Moss Hughes

Student Number: C20375736 & C20487654

Class Group: TU856, Game Engines 1

Video:

[![YouTube](https://img.youtube.com/vi/so_m6FLvtvA/hqdefault.jpg)](https://youtu.be/so_m6FLvtvA?si=qfMRXwqMvKNjLBHO)


# Description of the project
This is a Star Wars-themed game where the player has to fight waves of enemies of increasing size, by deflecting lasers back at them or by slashing them with the lightsaber.

# Instructions for use
## To Deploy on Meta Quest
- Run on Godot 4.1
- Run through Quest Link with link cable or Air Link.
or
- Deploy to the headset using Android.

## In-Game Instructions
- Move around with the right joystick
- Look around with the left joystick
- Swing lightsaber in the right hand to deflect bolts and destroy enemies!

# How it Works
## Wave System
The amount of enemies is determined by the exponential function below:
```
func getEnemiesNum():
	return (round ** 1.3) + 3
```
Enemies are then spawned gradually at a set interval along an arc of a circle with the following line:
```
enemyInstance.global_position = global_position + Vector3(cos((((PI/2)/enemiesGoal) * enemiesCreated-1) - PI/64) * randi_range(15, 20), 0, sin((((PI/2)/enemiesGoal) * enemiesCreated-1) - PI/64) * randi_range(15, 20))	
```
This line determines points along the arc of a circle using sin and cos, the arc in radians is split into even pieces according to the number of enemies that will be spawned in a given round, stored in enemiesGoal.
The arc is defined as PI/2, i.e. 45 degrees. this is divided by enemiesGoal, and shifted around the circle by PI/64 to position the enemies in line with the hangars opening.

When the enemy is killed, it emits a signal to notify the main scene that an enemy has been killed. The amount of enemies alive is tracked with the enemiesAlive variable. When this variable drops to 0, a new wave will begin, with a greater amount of enemies.

## Custom Sounds
All of the sounds used in this project were sampled from the Star Wars movies and edited by us using the Audacity software to make integration into the game more seamless.

## Player
For player control, we used various nodes from XR tools, such as XROrigin. We attached a lightsaber to the right hand, that the player can swing to deflect bolts and attack enemies.

## Lightsaber object
This has an Area3D collision object on the blade to handle collisions with the bolts and enemies. A directional sound can be heard from it as the player moves it.

## Enemies
The enemies will face the player as the player moves through the level. Each enemy is given a unique random interval that they will fire at. 
When an enemy dies, it instantiates a node at its global position that is used to play the enemy death sound and the instance of the enemy scene is removed. A separate node is used to play the enemy death sound as the enemy node itself is destroyed upon death, meaning that it won't be around to play its own death sound. A lightsaber attack sound effect is played, and an enemy death sound. There is a "standard" enemy death sound, and it has a 1 in 5 chance of playing the infamous "Wilhelm Scream" sound effect.

## Deflection
When the player's lightsaber hits an enemy laser bolt, it will return to the centre of the enemy who fired it, killing them. When an enemy fires a bolt, the bolt saves a pointer to the enemy object. When it collides with the lightsaber, if the enemy hasn't been killed yet it will return to it, otherwise, it will simply reverse its direction. When a bullet is deflected, it will play one of two potential sound effects.

##R2D2 Intro
The R2D2 model is a child of the start room scene, this scene stores R2D2's dialogue as an array of strings and programmatically animates the dialogue in a typing fashion with the use of a label3D node and a timer. Each string is separated with a 3-second delay before the next string is displayed, this delay is governed by another timer. A sound is also played alongside each string that is displayed.

## Environment
We used a hanger model as the main level, which we coloured. Collision shapes were added to the walls and floors to prevent the player from leaving the playspace.
We added a space skybox image, which can be seen through the large hangar view. The beginning R2D2 room was constructed ourselves.

## User Interface
We used two label3D nodes which we attached the the player camera to display the player's current health and the current wave the player is on.

# List of Scenes/Assets
| Scene/Asset                        | Source                                                                                     |
| ---------------------------------- | ------------------------------------------------------------------------------------------ |
| enemy.obj                          | Combined stormtrooper and blaster model, and posed with custom skeleton. References 1 & 10 | 
| Lightsaber.tscn                    | Meshes taken from a model. Reference 2 |
| R2D2 model                         | Reference 3 |
| Wilhelm Scream                     | Reference 4 |
| Lego Star Wars Trooper Death Sound | Reference 5 |
| Lightsaber Sounds                  | Reference 6 |
| Hangar Model                       | Reference 7 |
| R2D2 Sounds                        | Reference 8 |
| Blaster Sounds                     | Reference 9 |
| Duel of the fates/Theme            | Reference 11 |
| bolt.tscn                          | Custom |
| start_room.tscn                    | Custom |
| main.tscn                          | Custom |
| EnemyDeathSound.tscn               | Custom |
| enemy.tscn                         | Custom |
| Hangar.tscn                        | Custom |
| Lightsaber.tscn                    | Custom |



# References
| Reference No. | Reference Name                     | Source               |
| ------------- | ---------------------------------- | -------------------- |
| 1             | Stormtrooper Model                 | https://sketchfab.com/3d-models/ue4-storm-trooper-rigged-game-ready-077bbe07d52f44c18ef9f30422d50ee5 (FBX Version) |
| 2             | Lightsaber Model                   | https://free3d.com/3d-model/lightsaber-90106.html |
| 3             | R2D2 model                         | https://sketchfab.com/3d-models/star-wars-r2d2-de56744987ca4556b5040fedf3b8784b |
| 4             | Wilhelm Scream                     | https://www.youtube.com/watch?v=PP7WJL2JtLs&ab_channel=evildie.x |
| 5             | Lego Star Wars Trooper Death Sound | https://www.youtube.com/watch?v=sl-4I0v2fao&ab_channel=GabbaDax |
| 6             | Lightsaber Sounds                  | https://www.soundboard.com/sb/LightsaberSounds |
| 7             | Hangar Model                       | https://sketchfab.com/3d-models/star-wars-hangar-interior-model-841205af630444da911fa7a2e8541a16 |
| 8             | R2D2 Sounds                        | https://www.soundboard.com/sb/Toyota974 |
| 9             | Blaster Sounds                     | https://www.youtube.com/watch?v=D5wNdvLqZPE&ab_channel=soundeffects |
| 10            | Blaster Model                      | https://sketchfab.com/3d-models/low-poly-e11-blaster-0b2f979f1455405488869f02c29d91ea |
| 11            | DUEL OF THE FATES GOES HERE        |  |

# What We are most proud of in this assignment
- We are proud of text animation for R2D2
- We are proud of the enemy spawning code, and how it distributes along an arc with some randomness
- We are proud of the sound design and general atmosphere created
- We are proud of how well we managed to capture the feeling of being a Jedi!

# What We Learned
- We learned the intricacies of Godot, and how powerful it is at creating game prototypes
- We learned how challenging the process of developing interconnected systems can be
- We learned the planning and time required to build a polished game

# Project Proposal
The game will be Star Wars themed in which the player is moving through an environment on a moving platform using a lightsaber to deflect blaster beams.

# Miscellaneous Notes
The commit message for commit - "e451a6d" was not changed from the prior message as intended. A round system was implemented alongside an incomplete enemy spawning system, changes were also made to scenes.
