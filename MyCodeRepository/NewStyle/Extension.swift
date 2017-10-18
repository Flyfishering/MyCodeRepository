//
//  Extension.swift
//  MyCodeRepository
//
//  Created by 斌 on 2017/10/18.
//  Copyright © 2017年 binbin. All rights reserved.
//

import Foundation


//扩展Int ， 给 Int 添加了一个 enumKind 属性，将 int 数值分为正数，0，负数 三种情况
class IntExtension{
    init() {
        printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
    }
   
    func printIntegerKinds(_ numbers: [Int]) {
        print("+",terminator:"") //terminator 取消换行
        for number in numbers {
            switch number.kind {
            case .negative:
                print("-", terminator: "")
            case .zero:
                print("0", terminator: "")
            case .positive:
                print("+", terminator: "")
            }
        }
        print("")
    }
}

extension Int{
    enum Kind {
        case negative, zero, positive
    }
    // 重点看这里 在 `swift` 中 枚举的用处非常多。
    var kind: Kind {
        switch self {
        case 0:
            return .zero
        case let x where x > 0:
            return .positive
        default:
            return .negative
        }
    }
}
