//
//  MogoViewController1.swift
//  MogoInterviewDemo
//
//  Created by 王林 on 2017/7/31.
//  Copyright © 2017年 王林. All rights reserved.
//

import UIKit

class MogoViewController1: BaseViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func execute(finished: @escaping (MogoLoadDataState?) -> ()) {
        MogoApi.loadData { (data, error) in
            if(error == nil){
                finished(MogoLoadDataState.MogoLoadDataStateSuccess)
            }else{
                finished(MogoLoadDataState.MogoLoadDataStateFailed)
            }
        }
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
