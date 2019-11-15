//
//  BaseViewModelType.swift
//  Alamofire
//
//  Created by stan on 2019/9/24.
//

import UIKit

/// 标准ViewModel协议
protocol BaseViewModelType {
    
    associatedtype Input
    associatedtype Output
    
    var input: Input { get }
    var output: Output { get }
    
}
