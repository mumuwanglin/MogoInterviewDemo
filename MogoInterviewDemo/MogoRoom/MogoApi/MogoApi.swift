//
//  MogoApi.swift
//  MogoInterviewDemo
//
//  Created by 王林 on 2017/7/31.
//  Copyright © 2017年 王林. All rights reserved.
//  模拟数据接口

import UIKit


class MogoApi: NSObject {
    
    static func loadData(finished:@escaping (_ data: NSString?, _ error: NSString?)->()) {
        let randomValue = arc4random()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if(randomValue % 2 == 0) {
                finished("Success", nil)
            }else{
                finished(nil, "Failed")
            }
        }
    }
}
