//
//  UsageToolTipView.swift
//  Lixil-WILD-app
//
//  Created by tientm on 17/10/2022.
//

import Foundation
import UIKit

class UsageToolTipView: UIView {
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var grayView: UIView!
    @IBOutlet private weak var regularLabel: UILabel!
    @IBOutlet private weak var boldLabel: UILabel!
    private let regularText = "100円1リットルペットボトルを100円として換算。"
    private let boldText = "スーパー長期5なら、さらに40円お得！"
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    open func xibSetup() {
        let view = loadViewFromNib()
        view.frame = bounds
        self.addSubview(contentView)
        setupView()
    }
    
    func setupView() {
        contentView.layer.cornerRadius = 8
        contentView.backgroundColor = .white
        grayView.layer.cornerRadius = 8
        grayView.backgroundColor = .lightGray
        regularLabel.text = regularText
        regularLabel.textColor = .black
        boldLabel.text = boldText
        boldLabel.textColor = .black
    }
    
    private func loadViewFromNib() -> UIView {
        let nibName = String(describing: UsageToolTipView.self)
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: nibName, bundle: bundle)
        let nibViews = nib.instantiate(
            withOwner: self,
            options: nil)
        guard let nibView = nibViews.first as? UIView else {
            fatalError("Unable to instantiate RoundedCardItemView")
        }
        return nibView
    }
    
    @IBAction func detailsButtonDidTap(_ sender: UIButton) {
        print("Tap to button")
    }
}
