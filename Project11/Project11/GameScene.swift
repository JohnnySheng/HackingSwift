//
//  GameScene.swift
//  Project11
//
//  Created by Johnny on 2018/9/30.
//  Copyright © 2018年 MiaSheng. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "background.jpg")
        let screenSize = UIScreen.main.bounds.size;
        background.position = CGPoint(x: screenSize.height/2, y: screenSize.width/2)
        background.blendMode = .replace
        background.zPosition = -1
        addChild(background)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first{
            let location = touch.location(in: self)
            let box = SKSpriteNode(color: UIColor.red, size: CGSize(width: 64, height: 64))
            
            box.position = location
            addChild(box)
        }
    }
}
