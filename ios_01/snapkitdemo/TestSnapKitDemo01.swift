//
//  TestSnapKitDemo01.swift
//  ios_01
//
//  Created by 5 30 on 2025/6/6.
//

import UIKit

class TestSnapKitDemo01 : UIViewController {
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
    lazy var btn :UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(infoLabel)
        view.addSubview(btn)
    }


}

