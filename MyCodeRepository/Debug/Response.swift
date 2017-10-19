//
//  Response.swift
//  MyCodeRepository
//
//  Created by 斌 on 2017/10/18.
//  Copyright © 2017年 binbin. All rights reserved.
//

import Foundation


/// 网络返回的 data 转为 JsonString （可以显示中文字符）
/**
 data: 网络返回的 data 数据
 返回 String 格式的 json
 */
func jsonStringFromResponseData(_ data:Data) -> String {
    return String(data: JSONResponseDataFormatter(data), encoding: String.Encoding.utf8)!
}
/// data 格式化 解码为 json 再 编码为 data（以json格式转的data）
private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        // data 对象 转 json 对象
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        // json 对象 转 data 对象 有可能会出错
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}
