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
    
    //func to allow UIIView to change to UIImage:
    func imageChange(with view: UIView) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0.0)
        defer { UIGraphicsEndImageContext() }
        if let context = UIGraphicsGetCurrentContext() {
            view.layer.render(in: context)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            return image
        }
        return nil
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if let point = touch?.location(in: signatureDraw){
            startPoint = point
        }
        
    }
    
    
    //This is the draw for SignatureDraw (will change to allow
    func draw() {
        let strokeLayer = CAShapeLayer()
        strokeLayer.fillColor = nil
        strokeLayer.strokeColor = UIColor.black.cgColor
        strokeLayer.path = path.cgPath
        signatureDraw.layer.addSublayer(strokeLayer)
        signatureDraw.setNeedsDisplay()
    }
    
    //for touches began in the view
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
    
    //save section:
    
    @IBAction func finishedSigning(_ sender: Any) {
//
        guard let imageConverted = imageChange(with: signatureDraw) else {return}
        guard let imageData : Data = UIImagePNGRepresentation(imageConverted) else {return}
        
        print(imageData)
//        let image : UIImage = UIImage(image: imageConverted!)
//        let imageData: Data = UIImagePNGRepresentation(image)!
//        let str64 = imageData.base64EncodedData(options: .lineLength64Characters)
//        print(str64)
        
//        let data: NSData = NSData(base64Encoded: str64 , options: .ignoreUnknownCharacters)!
//        let dataImage = UIImage(data: data as Data)
        


        
        
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
