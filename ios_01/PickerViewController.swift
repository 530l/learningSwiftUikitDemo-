import UIKit
import SnapKit

class PickerViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    private let pickerView = UIPickerView()
    private let data = ["选项 A", "选项 B", "选项 C", "选项 D"]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        pickerView.dataSource = self
        pickerView.delegate = self

        view.addSubview(pickerView)
        pickerView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        print("PickerViewController did load")
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // 只有一列
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return data.count
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return data[row]
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("选择了: \(data[row])")
    }
}