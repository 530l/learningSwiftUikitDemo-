import UIKit
import SnapKit

class TextFieldViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let textField = UITextField()
        textField.placeholder = "请输入文本"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 18)

        view.addSubview(textField)

        textField.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(40)
        }
        
        // 在这里添加 UITextField 的具体使用示例代码
        print("TextFieldViewController did load")
    }
}