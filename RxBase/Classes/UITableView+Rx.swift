//
//  UITableView+Rx.swift
//  BaseFramework+Rx
//
//  Created by stan on 2019/9/23.
//  Copyright © 2019 stan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import MJRefresh

extension Reactive where Base: UIScrollView {
    
    public var refresh: ControlEvent<Void> {
        return ControlEvent<Void>(events: Observable<Void>.create({ (anyObsever) -> Disposable in
            self.base.mj_header = MJRefreshNormalHeader {
                anyObsever.onNext(())
            }
            return Disposables.create()
        }))
    }
    public var loadmore: ControlEvent<Void> {
        return ControlEvent<Void>(events: Observable<Void>.create({ (anyObsever) -> Disposable in
            self.base.mj_footer = MJRefreshBackStateFooter {
                anyObsever.onNext(())
            }
            return Disposables.create()
        }))
    }
    public var footerHidden: Binder<Bool> {
        return Binder(base){ (base, isHidden) in
            base.mj_footer.isHidden = !isHidden
        }
    }
}
