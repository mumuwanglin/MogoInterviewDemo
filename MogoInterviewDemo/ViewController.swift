//
//  ViewController.swift
//  MogoInterviewDemo
//
//  Created by 王林 on 2017/7/31.
//  Copyright © 2017年 王林. All rights reserved.
//

import UIKit


protocol MogoLoadDataProtocol: NSObjectProtocol {
    func loadData(state: MogoLoadDataState)
}

private let cellReuseIdentifier = "Cell"

class ViewController: UIViewController {
    
    var tableView: UITableView!
    
    //懒加载
    fileprivate lazy var childControllers: NSMutableArray = {
        return NSMutableArray()
    }()
    
    //如果需要子视图，可以在次添加
    var childNames:[String] = ["MogoViewController1","MogoViewController2","MogoViewController3","MogoViewController4","MogoViewController5"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //配置子视图
        configControllrtWithString()
        //设置tableView
        setupTableView()
    }
    
    func setupTableView() {
        tableView = UITableView(frame: view.frame)
        tableView.delegate = self
        tableView.dataSource = self
        tableView?.register(MogoTableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        self.view.addSubview(tableView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func configControllrtWithString() {
        
        for childName in childNames {

            guard let clsName = Bundle.main.infoDictionary!["CFBundleExecutable"] else {
                print("命名空间不存在")
                return
            }
            
            let cls : AnyClass? = NSClassFromString((clsName as! String) + "." + childName)
            
            
            guard let clsType = cls as? UIViewController.Type else {
                print("无法转换成UITableViewController")
                return
            }
            
            
            let childController = clsType.init()
            
            childControllers.add(childController)
            
        }        
    }
}

// MARK: - UITableViewDelegate, UITableViewDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return childControllers.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! MogoTableViewCell
        let bgColor = UIColor.randomColor()
        cell.backgroundColor = bgColor
        
        let childController = childControllers[indexPath.row] as! BaseViewController
        childController.view.backgroundColor = bgColor
        cell.setupCellWithData(state: childController.state!)
        childController.execute { (state) in
            cell.setupCellWithData(state: state!)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let childController = childControllers[indexPath.row] as! UIViewController
        
        self.navigationController?.pushViewController(childController, animated: true)
        self.tableView.deselectRow(at: indexPath, animated: true);
        
    }
}

