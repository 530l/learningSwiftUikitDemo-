import UIKit
import SnapKit

class ButtonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let button = UIButton(type: .system)
        button.setTitle("点击我", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8

        view.addSubview(button)

        button.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(120)
            make.height.equalTo(44)
        }
        
        print("ButtonViewController did load")
    }

    @objc func buttonTapped() {
        print("按钮被点击了！")
        let alert = UIAlertController(title: "提示", message: "按钮被点击了！", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "好的", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}