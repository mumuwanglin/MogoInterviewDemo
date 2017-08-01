//
//  MogoTableViewCell.swift
//  MogoInterviewDemo
//
//  Created by 王林 on 2017/8/1.
//  Copyright © 2017年 王林. All rights reserved.
//  自定义 cell

import UIKit

class MogoTableViewCell: UITableViewCell {

    var titleLabel: UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //设置 UI
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.titleLabel = UILabel.init()
        self.titleLabel?.backgroundColor = UIColor.clear;
        self.titleLabel?.frame = self.frame
        self.titleLabel?.textColor = UIColor.white
        self.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        self.titleLabel?.textAlignment = NSTextAlignment.center
        self.addSubview(self.titleLabel!)
    }
    //配置 UI 数据
    func setupCellWithData(state: MogoLoadDataState) {
        var titleText = ""
        switch state {
        case .MogoLoadDataStateFailed:
            titleText = "加载数据失败"
        case .MogoLoadDataStateSuccess:
            titleText = "加载数据成功"
        case .MogoLoadDataStateLoading:
            titleText = "数据加载中"        
        }
        self.titleLabel?.text = titleText
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
