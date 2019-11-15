//
//  UIButton+Rx.swift
//  Alamofire
//
//  Created by stan on 2019/9/25.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UIButton {
    
    /// 点击后附带自身button
    public var tapWithButton: ControlEvent<UIButton> {
        return ControlEvent(events: controlEvent(.touchUpInside).map{
            return self.base
        })
    }
    public var tapWithSelectedDone: ControlEvent<Bool> {
        return ControlEvent(events: controlEvent(.touchUpInside).map{
            self.base.isSelected = !self.base.isSelected
            return self.base.isSelected
        })
    }
}
