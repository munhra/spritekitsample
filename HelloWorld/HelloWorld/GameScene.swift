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
    let armoredEnemy:ArmoredEnemy = ArmoredEnemy()
    var enemiesList:Array<Enemy> = Array<Enemy>()
    
    override func didMoveToView(view: SKView) {
        let shoot:Shoot = Shoot()
        let moveable1:MoveProtocol = enemy2
        let moveable2:MoveProtocol = shoot
        moveable1.startMove()
        moveable2.startMove()
    }
    
    func orderAllEnemiesToAttack() {
        for (var i = 0 ; i < enemiesList.count ; i++){
            
            if let storedEnemy = enemiesList[i] as? ArmoredEnemy {
                storedEnemy.blastAttack()
            }else{
                enemiesList[i].doAttack()
            }
        
        }
    }
    
    func createEnemies(quantity:Int) {
        for (var i = 1 ; i <= quantity ; i++) {
            enemiesList.append(Enemy())
        }
        
        enemiesList.append(ArmoredEnemy())
    }
    
}
