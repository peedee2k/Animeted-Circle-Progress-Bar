//
//  ViewController.swift
//  Animeted Circle Progress Bar
//
//  Created by Pankaj Sharma on 2/11/18.
//  Copyright © 2018 Pankaj Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Circle Path
        let center = view.center
        let cerculerPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        //Let's make another view
        
        let myView: UIView = {
           let inview = UIView()
            inview.backgroundColor = UIColor.yellow
           inview.translatesAutoresizingMaskIntoConstraints = false
           return inview
        }()
        view.addSubview(myView)
        myView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        myView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        myView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        
        let centerInView = myView.center
        let runningCirclePath = CAShapeLayer()
        let myViewCerclePath = UIBezierPath(arcCenter: centerInView, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2*CGFloat.pi, clockwise: true)
        
        runningCirclePath.path = myViewCerclePath.cgPath
        runningCirclePath.fillColor = UIColor.clear.cgColor
        
        runningCirclePath.strokeColor = UIColor.lightGray.cgColor
        runningCirclePath.lineWidth = 10
       // runningCirclePath.lineCap = kCALineCapRound
       // runningCirclePath.strokeEnd = 0
        myView.layer.addSublayer(runningCirclePath)
        
        
        // Lets start drawing circle
        
        // This is just test comment.
        
        // Create a Track for circle
        let trackPath = CAShapeLayer()
        
       trackPath.path = cerculerPath.cgPath
        trackPath.lineWidth = 10
        trackPath.strokeColor = UIColor.lightGray.cgColor
        trackPath.fillColor = UIColor.clear.cgColor
        
       
        view.layer.addSublayer(trackPath)
        
//        let cerculerPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -CGFloat.pi/2, endAngle: 2 * CGFloat.pi, clockwise: true)
        shapeLayer.path = cerculerPath.cgPath
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.lineCap = kCALineCapRound
        
        shapeLayer.strokeEnd = 0
        
        view.layer.addSublayer(shapeLayer)
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTap)))
        
    }
    @objc func handleTap() {
       let basicAnimaton = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimaton.toValue = 1
        basicAnimaton.duration = 2
        basicAnimaton.fillMode = kCAFillModeForwards
        basicAnimaton.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimaton, forKey: "urSoBasic")
    }
    
    
}

