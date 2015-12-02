//
//  GameScene.swift
//  HelloWorld
//
//  Created by Rafael Munhoz on 02/12/15.
//  Copyright (c) 2015 VntCurso. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    
    var score:Int = 0
    let xPosition = 200
    let yPosition = 400
    var hp:Float = 100.99
    var gameover:Bool = false
    var scoreText:String = "Score : "
    let weapon = ("shuriken",100)
    let enemy:Enemy = Enemy()
    let enemy2:Enemy = Enemy(healthpoints: 200)
    var enemiesList:Array<Enemy> = Array<Enemy>()
    
    
    override func didMoveToView(view: SKView) {
        
        var integerhp = Int(hp)
        print("Position x \(xPosition)")
        print("Position y \(yPosition)")
        print("Weapon Type \(weapon.1) Weapon Damage \(weapon.0)")
        print("HP integer part \(integerhp)")
        print("Enemy healthPoints \(enemy.healthpoints)")
        print("Enemy 2 healthPoints \(enemy2.healthpoints)")
        print("Enemy state \(enemy.enemystate)")
        enemy.doAttack()
        enemy.receivePlayerAttack(200, weapon: "Sword")
       
        //enemiesList.append(enemy)
        //enemiesList.append(enemy2)
        
        //print("Health points of enemy at 0 \(enemiesList[0].healthpoints)")
        //print("Health points of enemy at 1 \(enemiesList[1].healthpoints)")
        
        //enemiesList.removeAtIndex(0)
        
        //print("Health points of enemy at 0 \(enemiesList[0].healthpoints)")
        //print("Enemies left \(enemiesList.count)")
        
        print("Power strike damage \(enemy.doPowerStrike(xPosition, playerY:yPosition))")
        print("Power strike damage \(enemy.doPowerStrike(xPosition, playerY:yPosition))")
        
        enemy.playAnimationByCurrentState()
        enemy.enemystate = Enemy.EnemyState.Attacking
        enemy.playAnimationByCurrentState()
        
        createEnemies(10)
        print("Created \(enemiesList.count) new enemies")
        
    }
    
    func createEnemies(quantity:Int) {
        for (var i = 1 ; i <= quantity ; i++) {
            enemiesList.append(Enemy())
        }
    }
    
}
