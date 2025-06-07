//
//  TestSnapKitDemo01.swift
//  ios_01
//
//  Created by 5 30 on 2025/6/7.
//

import UIKit

class TestSnapKitDemo01 : UIViewController {
    
    lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text="123"
        label.backgroundColor = UIColor.red
        label.textColor = UIColor.black
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            // 在 anroid 中约束布局，如果一个控件设置了宽高，上下左右以 父 为约束这个infoLabel应该居中才对？
            // 为什么在 ios，会撑满屏幕了？
            //top/bottom/left/right 四边贴父视图 => 要求 label 和父 view 一样大（全屏）
            //width/height/size.equalTo(100) => 又要求 label 是 100x100
            //这就相当于你对系统说：
            //“我想要一个和屏幕一样大的 label，但又希望它是 100x100。”
            //这种矛盾会导致 Auto Layout 引擎无法满足所有条件，只能选择性忽略一些约束。
            
            //在 SnapKit / Auto Layout 中，它的意思是：
            //“让当前控件的上下左右四边都贴紧父视图（superview），即和父视图一样大。”
//            make.top.equalToSuperview()
              make.bottom.equalToSuperview()
//            make.left .equalToSuperview()
//            make.right.equalToSuperview()
            
            //居中显示                 make.center.equalToSuperview()                                  ✅ 推荐
            //固定大小并居中            make.center.equalToSuperview() + make.size.equalTo(...)        ✅ 推荐
            //填满父视图               make.edges.equalToSuperview()                                  ✅ 推荐
            //四边拉满 + 固定大小       冲突，不可取                                                    ❌ 不推荐
            
            //center.equalToSuperview() 表示“中心点对齐父视图”，
            //这样就可以了。infoLabel固定 100，以父为约束，居中。
//            make.center.equalToSuperview()

            
              make.size.equalTo(100) // 等价于 make.width.height.equalTo(100)
//            make.height.equalTo(100)
//            make.width.equalTo(100)
        }
    }

}

// 预览
#Preview("NumberVC") {
    let controller = TestSnapKitDemo01()
    return controller
}




//#Preview("Memories"){
//    let view: UILabel = {
//        let label = UILabel()
//        label.text="123"
//        label.textColor = UIColor.black
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.font = UIFont.systemFont(ofSize: 12)
//        return label
//    }()
////    let view :UIButton = UIButton()
//    
//    return view
//}
