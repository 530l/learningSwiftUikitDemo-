import UIKit
import SnapKit // 如果您计划在该页面使用 SnapKit

class LabelViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // self.title = "UILabel 示例" // 标题已在 ListViewController 中设置

        let label = UILabel()
        label.text = "这是一个 UILabel 示例"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 20)

        view.addSubview(label)

        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
        
        // 在这里添加 UILabel 的具体使用示例代码
        print("LabelViewController did load")
    }
}