//
//  HTIndicatorView3.swift
//  TestHTIndicator
//
//  Created by UltraHigh on 6/1/18.
//  Copyright © 2018 Apple. All rights reserved.
//

import UIKit

class HTIndicatorView3: UIView {
    
    //MARK:- SUPPORT VARIABLES
    private var isAnimate: Bool = true
    private var dotSize: CGFloat = 0
    
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
        isAnimate = false
        
    }
    
    func startAnimate() {
        isAnimate = true
        dotSize = self.frame.width * 0.3
        createIndicator()
    }
    
    //MARK: - Config
    private func createIndicator(){
        
        let dotSpace = self.frame.width * 0.05
        
        for i in 0..<3 {
            let dot = UIView(frame: CGRect(x: CGFloat(i) * (dotSize + dotSpace), y: (self.frame.width - dotSize) / 2, width: dotSize, height: dotSize))
            dot.backgroundColor = self.color
            dot.layer.cornerRadius = dotSize / 2
            self.addSubview(dot)
            animate(view: dot, delay: Double(i) * 0.1)
        }
    }
    
    private func animate(view: UIView, delay: Double) {
        if isAnimate {
            UIView.animate(withDuration: 0.3, delay: delay, options: [], animations: {
                self.configAniView(view, point: CGPoint(x: view.frame.origin.x, y: view.frame.origin.y - self.dotSize))
            }, completion: { _ in
                UIView.animate(withDuration: 0.3, delay: 0, options: [], animations: {
                    self.configAniView(view, point: CGPoint(x: view.frame.origin.x, y: view.frame.origin.y + self.dotSize))
                }, completion: { _ in
                    self.animate(view: view, delay: 0.3)
                })
            })
        }
    }
    
    private func configAniView(_ view: UIView, point: CGPoint) {
        view.frame.origin = point
        view.layer.cornerRadius = view.frame.width / 2
        view.layer.masksToBounds = self.dotSize / 2 > 0
    }
}



















