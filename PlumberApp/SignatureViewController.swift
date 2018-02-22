//
//  CustomerClass.swift
//  PlumberApp
//
//  Created by Vineet Baid on 19/02/18.
//  Copyright © 2018 Vineet Baid. All rights reserved.
//

import UIKit

class SignatureViewController: UIViewController {
    
    @IBOutlet var signatureDraw: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        signatureDraw.clipsToBounds = true
        signatureDraw.dropShadow()
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
