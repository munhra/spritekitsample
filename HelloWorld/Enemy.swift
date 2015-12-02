//
//  Enemy.swift
//  HelloWorld
//
//  Created by Rafael Munhoz on 02/12/15.
//  Copyright © 2015 VntCurso. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy {
   
    struct InitialPosition {
        var posX:Int;
        var posY:Int;
    }
    
    enum EnemyState {
        case Idle
        case Attacking
        case Moving
    }
    
    var healthpoints:Int = 0
    var enemystate:EnemyState = EnemyState.Idle
    var powerStrikeCharge:Int = 1
    var name:String?
    
    init() {
        
    }
    
    init(healthpoints:Int) {
        self.healthpoints = healthpoints
    }
    
    func doAttack() {
        print("Peform attack code !")
    }
    
    func receivePlayerAttack(hitpoints:Int, weapon:String) {
        print("remove \(hitpoints) from health by a damage caused with weapon \(weapon)")
    }
    
    func doPowerStrike(playerX:Int, playerY:Int) -> Int {
        
        if powerStrikeCharge == 0 {
            return 0
        } else {
            powerStrikeCharge--
            return 1000
        }
    
    }
    
    func playAnimationByCurrentState() {
        
        switch enemystate {
        case .Idle:
            print("Play enemy idle Animation")
        case .Attacking:
            print("Play enemy attack Animation")
        case .Moving:
            print("Play enemy moving Animation")
            
        }
    }
    
}
