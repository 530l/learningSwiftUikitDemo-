import UIKit
import SnapKit

class NavigationBarExampleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        // self.title = "导航栏示例" // 标题已在 ListViewController 中设置

        // 添加导航栏按钮
        let rightButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(rightButtonTapped))
        self.navigationItem.rightBarButtonItem = rightButton

        let infoLabel = UILabel()
        infoLabel.text = "导航栏通常由 UINavigationController 提供。\n这里演示了如何添加导航栏按钮。"
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.greaterThanOrEqualToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
        print("NavigationBarExampleController did load")
    }

    @objc func rightButtonTapped() {
        print("导航栏右侧按钮被点击")
    }
}