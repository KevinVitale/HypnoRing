//
//  AppDelegate.swift
//  HypnoRing
//
//  Created by Kevin Vitale on 3/12/20.
//  Copyright © 2020 Kevin Vitale. All rights reserved.
//

import Cocoa
import SpriteKit

class Scene: SKScene {
    override func didMove(to view: SKView) {
        let layer = view.layer!

        // layer.cornerRadius = layer.frame.height * 0.5
        // layer.borderColor = SKColor.red.cgColor
        // layer.borderWidth = 12.0

        let size = view.frame.size.applying(CGAffineTransform(scaleX: layer.contentsScale, y: layer.contentsScale))
        let node = SKSpriteNode(color: .clear, size: size)
        let shader = SKShader(fileNamed: "PinWheel.fsh")

        let a_center = vector_float2(0.75, 0.75)
        let a_color = vector_float4(1, 0, 0, 0)
        
        shader.uniforms = [
            SKUniform(name: "a_center", vectorFloat2: a_center),
            SKUniform(name: "a_color", vectorFloat4: a_color),
        ]
        node.shader = shader
        
        self.addChild(node)
    }
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        let view = window.contentView as! SKView
        let scene = Scene(size: view.frame.size)

        view.presentScene(scene)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

