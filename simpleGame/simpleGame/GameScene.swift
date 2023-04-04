//
//  GameScene.swift
//  simpleGame
//
//  Created by Abduraxmon on 05/04/23.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let player = SKShapeNode(circleOfRadius: 16)
    let terrain = SKShapeNode(rectOf: CGSize(width: 500, height: 30))
    
    var topBorder = SKShapeNode()
    var bottomBorder = SKShapeNode()
    var leftBorder = SKShapeNode()
    var rightBorder = SKShapeNode()
    
    var startTouch = CGPoint()
    var endTouch = CGPoint()
    
    override func didMove(to view: SKView) {
        backgroundColor = .gray
        
        player.strokeColor = .black
        player.fillColor = .black
        player.physicsBody = SKPhysicsBody(circleOfRadius: 16)
        player.physicsBody?.affectedByGravity = true
        player.physicsBody?.isDynamic = true
        player.position = .init(x: 0, y: 100)
        addChild(player)
        
        terrain.strokeColor = .brown
        terrain.fillColor = .brown
        terrain.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 500, height: 30))
        terrain.physicsBody?.affectedByGravity = false
        terrain.physicsBody?.isDynamic = false
        terrain.position = .init(x: 0, y: -frame.height/4)
        addChild(terrain)
        
        bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 1))
        bottomBorder.physicsBody?.affectedByGravity = false
        bottomBorder.physicsBody?.isDynamic = false
        bottomBorder.position = .init(x: 0, y: -frame.height/2)
        addChild(bottomBorder)
        
        topBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 1))
        topBorder.physicsBody?.affectedByGravity = false
        topBorder.physicsBody?.isDynamic = false
        topBorder.position = .init(x: 0, y: frame.height/2)
        addChild(topBorder)
        
        leftBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: frame.height))
        leftBorder.physicsBody?.affectedByGravity = false
        leftBorder.physicsBody?.isDynamic = false
        leftBorder.position = .init(x: -frame.width/2, y:0 )
        addChild(leftBorder)
        
        rightBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: frame.height))
        rightBorder.physicsBody?.affectedByGravity = false
        rightBorder.physicsBody?.isDynamic = false
        rightBorder.position = .init(x: frame.width / 2, y: 0)
        addChild(rightBorder)
        
        let camera = SKCameraNode()
        camera.setScale(2)
        addChild(camera)
        scene?.camera = camera
        
    }
    
    
    func touchDown(atPoint pos : CGPoint) {

    }
    
    func touchMoved(toPoint pos : CGPoint) {

    }
    
    func touchUp(atPoint pos : CGPoint) {

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            startTouch = touch.location(in: self)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
       
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            endTouch = touch.location(in: self)
        }
        
        player.physicsBody?.applyImpulse(CGVector(dx: endTouch.x - startTouch.x, dy: endTouch.y - startTouch.y))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
}
