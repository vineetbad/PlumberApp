//
//  CustomerClass.swift
//  PlumberApp
//
//  Created by Vineet Baid on 19/02/18.
//  Copyright © 2018 Vineet Baid. All rights reserved.
//

import UIKit

class SignatureViewController: UIViewController {
    var path = UIBezierPath()
    var startPoint = CGPoint()
    var touchPoint = CGPoint()
    
    @IBOutlet var signatureDraw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signatureDraw.clipsToBounds = true
        signatureDraw.isMultipleTouchEnabled = false
        signatureDraw.dropShadow()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: signatureDraw){
            startPoint = point
        }
        
    }
    
    func draw() {
        let strokeLayer = CAShapeLayer()
        strokeLayer.fillColor = nil
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.path = path.cgPath
        signatureDraw.layer.addSublayer(strokeLayer)
        signatureDraw.setNeedsDisplay()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: signatureDraw){
            touchPoint = point
        }
        path.move(to: startPoint)
        path.addLine(to: touchPoint)
        startPoint = touchPoint
        draw()
    }
    
    @IBAction func clearSignature(_ sender: Any) {
        
        path.removeAllPoints()
        signatureDraw.layer.sublayers = nil
        signatureDraw.setNeedsDisplay()
        
    }
    
    
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
}
