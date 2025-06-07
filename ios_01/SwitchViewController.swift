import UIKit
import SnapKit

class SwitchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let mySwitch = UISwitch()
        mySwitch.addTarget(self, action: #selector(switchChanged(_:)), for: .valueChanged)

        view.addSubview(mySwitch)
        mySwitch.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        print("SwitchViewController did load")
    }

    @objc func switchChanged(_ sender: UISwitch) {
        print("开关状态: \(sender.isOn ? "开" : "关")")
    }
}