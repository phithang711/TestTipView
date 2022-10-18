//
//  ViewController.swift
//  TestTipView
//
//  Created by tientm on 18/10/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        // Do any additional setup after loading the view.
    }
    
    @IBAction func showTip(_ sender: UIButton) {
        var pre = CustomTipView.globalPreferences
        pre.drawing.arrowPosition = .bottom
        let rightInset = (UIScreen.main.bounds.size.width - 320) / 2
        pre.positioning.bubbleInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: rightInset)
        pre.animating.dismissOnTap = false
        pre.positioning.contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        pre.drawing.shadowOffset = CGSize(width: 0, height: 0)
        let contentView = UsageToolTipView(frame: CGRect(x: 0, y: 0, width: 320, height: 156))
        CustomTipView.show(animated: true,
                           forView: sender,
                           withinSuperview: nil,
                           contentView: contentView,
                           preferences: pre)
    }

}


extension UIView {
    
    func hasSuperview(_ superview: UIView) -> Bool{
        return viewHasSuperview(self, superview: superview)
    }
    
    fileprivate func viewHasSuperview(_ view: UIView, superview: UIView) -> Bool {
        if let sview = view.superview {
            if sview === superview {
                return true
            } else{
                return viewHasSuperview(sview, superview: superview)
            }
        } else{
            return false
        }
    }
}

extension CGRect {
    var x: CGFloat {
        get {
            return self.origin.x
        }
        set {
            self.origin.x = newValue
        }
    }
    
    var y: CGFloat {
        get {
            return self.origin.y
        }
        
        set {
            self.origin.y = newValue
        }
    }
    
    var center: CGPoint {
        return CGPoint(x: self.x + self.width / 2, y: self.y + self.height / 2)
    }
}
