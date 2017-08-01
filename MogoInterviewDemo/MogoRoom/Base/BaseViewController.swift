//
//  BaseViewController.swift
//  MogoInterviewDemo
//
//  Created by 王林 on 2017/8/1.
//  Copyright © 2017年 王林. All rights reserved.
//  基类

import UIKit
enum MogoLoadDataState {
    case MogoLoadDataStateLoading
    case MogoLoadDataStateSuccess
    case MogoLoadDataStateFailed
}


class BaseViewController: UIViewController {

    var state: MogoLoadDataState?
    
    func execute(finished:@escaping (_ state: MogoLoadDataState?)->()) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()

        state = MogoLoadDataState.MogoLoadDataStateLoading
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
