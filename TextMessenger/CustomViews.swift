//
//  CustomViews.swift
//  TextMessenger
//
//  Created by Ademi on 04/01/2019.
//  Copyright © 2019 Dokitari. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor(white: 0.2, alpha: 1)
        textAlignment = .center
        textColor = UIColor.white
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        let originalIntrinsicSize = super.intrinsicContentSize
        let height = originalIntrinsicSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalIntrinsicSize.width + 16, height: height)
    }
}
