//
//  UITextField+Rx.swift
//  Alamofire
//
//  Created by stan on 2019/9/25.
//

import UIKit
import RxSwift
import RxCocoa

extension Reactive where Base: UITextField {
    
    /// placeHolder
    public var placeHolder: Binder<String?> {
        return Binder(self.base) { textField, text in
            textField.placeholder = text
        }
    }
    /// keyBoardType
    public var keyBoardType: Binder<UIKeyboardType> {
        return Binder(self.base) { textField, type in
            textField.keyboardType = type
        }
    }
    /// secureTextEntry
    public var secureTextEntry: Binder<Bool> {
        return Binder(self.base) { textField, isSecure in
            textField.isSecureTextEntry = isSecure
        }
    }
}

