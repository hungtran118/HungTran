//
//  HTIndicatorView.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var circle = UIView()
    private var isNotAnimated: Bool = true
    
    //MARK:- Custom color
    @IBInspectable var indicatorColor: UIColor {
        get {
            return self.color
        }
        set {
            self.color = newValue
        }
    }
    
    var color = UIColor.white
    
    //MARK:- Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        self.subviews.forEach({ $0.removeFromSuperview()})
    }
    
    func startAnimate() {
        createIndicator()
    }
    
    //MARK: - Config
    private func createIndicator() {
        for i in 0...2 {
            
            circle = UIView(frame: CGRect(x: self.frame.width / 2, y: self.frame.height / 2, width: 0, height: 0))
            circle.backgroundColor = self.color
            circle.alpha = 0.7
            
            self.addSubview(circle)
            
            animate(view: circle, delay: Double(i) / 5 )
        }
    }
    
    private func animate(view: UIView, delay: TimeInterval) {
        
        UIView.animate(withDuration: 1, delay: delay, options: [.curveLinear], animations: {
            view.bounds = CGRect(origin: view.frame.origin, size: CGSize(width: self.frame.width, height: self.frame.height))
            view.layer.cornerRadius = view.frame.width / 2
            view.layer.masksToBounds = view.frame.width / 2 > 0
            view.alpha = 0
        }) { _ in
            view.bounds = CGRect(origin: view.frame.origin, size: .zero)
            view.layer.cornerRadius = view.frame.width / 2
            view.layer.masksToBounds = view.frame.width / 2 > 0
            view.alpha = 0.7
            self.animate(view: view, delay: 0.2)
        }
    }
}

















