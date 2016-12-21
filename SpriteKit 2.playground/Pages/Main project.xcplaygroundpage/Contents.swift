//: # My God Its Full of Stars
//: There are lots of more accurate ways to build a star field, but let's do it with a single particle emitter. As usual we'll start with what we had on the [previous page](@previous)

import SpriteKit
import PlaygroundSupport

let frame = CGRect(x: 0, y: 0, width: 320, height: 256)
let midPoint = CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0)

var scene = SKScene(size: frame.size)

let christmastree = SKSpriteNode(imageNamed: "8big_tree")
christmastree.position = midPoint
christmastree.setScale(0.2)

let actionMoveUp = SKAction.moveBy(x: 20, y: 0, duration: 1)
let actionMoveDown = SKAction.moveBy(x: -20, y: 0, duration: 1)
let actionSequence = SKAction.sequence([actionMoveUp, actionMoveDown])
let actionRepeat = SKAction.repeatForever(actionSequence)
christmastree.run(actionRepeat)
christmastree.zPosition = 10  // Ensure sprite is above background
scene.addChild(christmastree) // Add to the scene

//: ## Adding the Star Emitter
//: Emitters are great for simple effects like this.. we will create one that occasionally spews out a star with a random speed, alpha, and y position
let emitter = SKEmitterNode()
emitter.particleLifetime = 50
emitter.particleBlendMode = SKBlendMode.alpha
emitter.particleBirthRate = 5
emitter.particleSize = CGSize(width: 4,height: 4)
emitter.particleColor = SKColor(red: 100, green: 100, blue: 255, alpha: 1)
emitter.position = CGPoint(x:midPoint.x,y:frame.size.width)
emitter.particleSpeed = 16
emitter.particleSpeedRange = 100
emitter.particlePositionRange = CGVector(dx: frame.size.width, dy: 0)
emitter.emissionAngle = 4.7
emitter.advanceSimulationTime(40)
emitter.particleAlpha = 0.5
emitter.particleAlphaRange = 0.5
scene.addChild(emitter)

let actionPlaySound = SKAction.playSoundFileNamed("SLEIGH RIDE.mp3", waitForCompletion: false)
scene.run(actionPlaySound)
//: And show the scene in the liveView


let view = SKView(frame: frame)
view.presentScene(scene)
PlaygroundPage.current.liveView = view

let text = SKLabelNode(fontNamed: "Arial")
text.text = "Merry Christmas"
text.horizontalAlignmentMode = .center
text.fontSize = 35
text.position = CGPoint(x: 160, y: 10)
scene.addChild(text)
//: All good, but it's just not there yet... [we should add a rainbow trail](@next)
