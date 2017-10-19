//
//  Debug.swift
//  MyCodeRepository
//
//  Created by 斌 on 2017/10/18.
//  Copyright © 2017年 binbin. All rights reserved.
//

import Foundation

/// debug 情况下 的printLog 信息， 直接扔到方法中就好
func printLog<T>(message: T,
                 file: String = #file,
                 method: String = #function,
                 line: Int = #line)
{
    #if DEBUG
        print("\((file as NSString).lastPathComponent)[\(line)], \(method): \(message)")
    #endif
}


/// 打印 版本号， 应用名称， build号， 唯一标识符号等
func logInfoPlist(){
    /// app 名称
    let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName") ?? "应用名称为空"
    /// 版本号
    let viersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString" as String) ?? "版本号为空"
    /// 项目id 唯一标识符号
    let identifierKey = Bundle.main.object(forInfoDictionaryKey: kCFBundleIdentifierKey as String) ?? "唯一标识符号为空"
    /// build 号
    let versionKey = Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) ?? "build 号码为空"
    
    
    /// 执行文件名字
    let executableKey = Bundle.main.object(forInfoDictionaryKey: kCFBundleExecutableKey as String) ?? "项目名称为空"
    print(name,viersion,executableKey,identifierKey,versionKey,separator: "\n", terminator: "\n")
}
