import UIKit
import SnapKit

// 定义场景枚举，用于表示列表中的不同 UIKit 控件示例
enum Scenario: String, CaseIterable {
    case uiLabel = "UILabel (文本标签)"
    case uiTextField = "UITextField (单行输入框)"
    case uiTextView = "UITextView (多行文本视图)"
    case uiButton = "UIButton (按钮)"
    case uiImageView = "UIImageView (图片视图)"
    case uiTableView = "UITableView (列表视图)"
    case uiCollectionView = "UICollectionView (集合视图)"
    case uiPickerView = "UIPickerView (选择器)"
    case uiSwitch = "UISwitch (开关)"
    case uiSegmentedControl = "UISegmentedControl (分段控件)"
    case uiProgressView = "UIProgressView (进度条)"
    case uiActivityIndicatorView = "UIActivityIndicatorView (活动指示器)"
    case uiSlider = "UISlider (滑块)"
    case uiNavigationBar = "UINavigationBar (导航栏 - 通常由UINavigationController管理)"
    case uiTabBar = "UITabBar (标签栏 - 通常由UITabBarController管理)"
    case uiScrollView = "UIScrollView (滚动视图)"
    case uiStackView = "UIStackView (堆栈视图)"
    case uiAlertController = "UIAlertController (警告框/操作表)"
    case uiTestSnapKitDemo01 = "TestSnapKitDemo01"

    // 根据不同的场景返回对应的视图控制器 (ViewController)
    var viewController: UIViewController {
        switch self {
        case .uiLabel:
            // 假设您会创建一个名为 LabelViewController 的文件
            return LabelViewController() // 您需要创建这个 ViewController
        case .uiTextField:
            return TextFieldViewController() // 您需要创建这个 ViewController
        case .uiTextView:
            return TextViewViewController() // 您需要创建这个 ViewController
        case .uiButton:
            return ButtonViewController() // 您需要创建这个 ViewController
        case .uiImageView:
            return ImageViewViewController() // 您需要创建这个 ViewController
        case .uiTableView:
            return TableViewExampleController() // 您需要创建这个 ViewController
        case .uiCollectionView:
            return CollectionViewExampleController() // 您需要创建这个 ViewController
        case .uiPickerView:
            return PickerViewController() // 您需要创建这个 ViewController
        case .uiSwitch:
            return SwitchViewController() // 您需要创建这个 ViewController
        case .uiSegmentedControl:
            return SegmentedControlViewController() // 您需要创建这个 ViewController
        case .uiProgressView:
            return ProgressViewController() // 您需要创建这个 ViewController
        case .uiActivityIndicatorView:
            return ActivityIndicatorViewController() // 您需要创建这个 ViewController
        case .uiSlider:
            return SliderViewController() // 您需要创建这个 ViewController
        case .uiNavigationBar:
            return NavigationBarExampleController() // 您需要创建这个 ViewController
        case .uiTabBar:
            return TabBarExampleController() // 您需要创建这个 ViewController
        case .uiScrollView:
            return ScrollViewExampleController() // 您需要创建这个 ViewController
        case .uiStackView:
            return StackViewExampleController() // 您需要创建这个 ViewController
        case .uiAlertController:
            return AlertControllerExampleController() // 您需要创建这个 ViewController
         case .uiTestSnapKitDemo01:
             return TestSnapKitDemo01()
        }
    }
}

// 它通过 UITableViewDelegate 和 UITableViewDataSource 协议来管理 UITableView
class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // 声明一个 UITableView 实例，这是 iOS 中用于显示列表的核心控件
    private let tableView = UITableView()
    private let scenarios = Scenario.allCases

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UIKit 控件示例" // 更新标题
        view.backgroundColor = .white

        setupTableView()
    }

    func setupTableView() {
        view.addSubview(tableView)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")

        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return scenarios.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let scenario = scenarios[indexPath.row]
        cell.textLabel?.text = scenario.rawValue
        cell.accessoryType = .disclosureIndicator
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let scenario = scenarios[indexPath.row]
        let vc = scenario.viewController
        vc.title = scenario.rawValue // 设置跳转后页面的标题
        navigationController?.pushViewController(vc, animated: true)
    }
}
