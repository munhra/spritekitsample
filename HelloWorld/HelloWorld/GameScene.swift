//
//  GameScene.swift
//  HelloWorld
//
//  Created by Rafael Munhoz on 02/12/15.
//  Copyright (c) 2015 VntCurso. All rights reserved.
//

import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    let player = SKSpriteNode(imageNamed: "Spaceship")
    let background = SKSpriteNode(imageNamed: "background")


    override func didMoveToView(view: SKView) {
       
        player.position = CGPoint(x:size.width * 0.1, y:size.height * 0.5)
        background.position = CGPoint(x:size.width/2, y:size.height/2)

        background.zPosition = -1
        addChild(background)
        addChild(player)
        
        
        runAction(SKAction.repeatActionForever(SKAction.sequence([SKAction.runBlock(addEnemy),SKAction.waitForDuration(0.3) ])))
    
        physicsWorld.gravity = CGVectorMake(0, 0)
        physicsWorld.contactDelegate = self
    
    }
    
    func addEnemy() {
        
        let monster = Enemy(healthpoints: 100)
        let actualY = random(min: 0, max: size.height - monster.size.height/2)
        
        monster.position = CGPoint(x: size.width + monster.size.width/2, y: actualY)
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        let actionMove = SKAction.moveTo(CGPoint(x: -monster.size.width/2, y: actualY), duration: NSTimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        monster.runAction(SKAction.sequence([actionMove, actionMoveDone]))
        
        monster.physicsBody = SKPhysicsBody(rectangleOfSize: monster.size)
        monster.physicsBody?.dynamic = true
        monster.physicsBody?.categoryBitMask = 1
        monster.physicsBody?.collisionBitMask = 0

        addChild(monster)
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let bullet = SKSpriteNode(imageNamed: "projectile")
        let touch = touches.first
        let touchLocation = touch?.locationInNode(self)
        
        bullet.position = player.position
        
        
        bullet.physicsBody = SKPhysicsBody(rectangleOfSize: bullet.size)
        bullet.physicsBody?.dynamic = true
        bullet.physicsBody?.categoryBitMask = 2
        bullet.physicsBody?.contactTestBitMask = 1
        
        addChild(bullet)
        
        let actionMove = SKAction.moveTo(touchLocation!, duration: 0.5)
        let actionMoveDone = SKAction.removeFromParent()
        
        bullet.runAction(SKAction.sequence([actionMove,actionMoveDone]))
        
    }
    
    func didBeginContact(contact: SKPhysicsContact) {
        
        contact.bodyA.node?.removeFromParent()
        contact.bodyB.node?.removeFromParent()
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
}
