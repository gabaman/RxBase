//
//  DoOnNext.swift
//  OPTBaseFramework
//
//  Created by stan on 2019/11/8.
//

import UIKit

extension ObservableType where E == Bool? {
    public func unWraped() -> Observable<Bool> {
        return self.flatMap { $0.map(Observable.just) ?? Observable.empty() }
    }
}

extension ObservableType where E == String? {
    public func unWraped() -> Observable<String> {
        return self.flatMap { $0.map(Observable.just) ?? Observable.empty() }
    }
}

extension ObservableType where E == Int? {
    public func unWraped() -> Observable<Int> {
        return self.flatMap { $0.map(Observable.just) ?? Observable.empty() }
    }
}

extension Observable {
    public func doOnNext(_ closure: @escaping (Element) -> Void) -> Observable<Element> {
        return self.do(onNext: { (element) in
            closure(element)
        })
    }
    
    public func doOnError(_ closure: @escaping (Error) -> Void) -> Observable<Element> {
        return self.do(onError: { (error) in
            closure(error)
        })
    }
    
    public func doOnCompleted(_ closure: @escaping () -> Void) ->  Observable<Element> {
        return self.do(onCompleted: {
            closure()
        })
    }
    
    public func doOnSubscribe(_ closure: @escaping () -> Void) -> Observable<Element> {
        return self.do(onSubscribe: {
            closure()
        })
    }
    
    public func doOnDisposed(_ closure: @escaping () -> Void)-> Observable<Element> {
        return self.do(onDispose: {
            closure()
        })
    }
}
