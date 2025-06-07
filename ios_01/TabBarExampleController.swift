import UIKit
import SnapKit

class TabBarExampleController: UIViewController, UITabBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray

        let tabBar = UITabBar()
        let item1 = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        let item2 = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let item3 = UITabBarItem(tabBarSystemItem: .contacts, tag: 2)
        tabBar.items = [item1, item2, item3]
        tabBar.selectedItem = item1
        tabBar.delegate = self // 需要设置代理来响应点击

        view.addSubview(tabBar)
        tabBar.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(50) // 根据需要调整
        }

        let infoLabel = UILabel()
        infoLabel.text = "UITabBar 通常由 UITabBarController 管理。\n这是一个独立的 UITabBar 示例。"
        infoLabel.numberOfLines = 0
        infoLabel.textAlignment = .center
        view.addSubview(infoLabel)
        infoLabel.snp.makeConstraints { make in
            make.center.equalToSuperview()
             make.leading.greaterThanOrEqualToSuperview().offset(20)
            make.trailing.lessThanOrEqualToSuperview().offset(-20)
        }
        print("TabBarExampleController did load")
    }

    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("选择了标签: \(item.tag)")
    }
}