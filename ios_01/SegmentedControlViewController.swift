import UIKit
import SnapKit

class SegmentedControlViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let items = ["第一项", "第二项", "第三项"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(segmentChanged(_:)), for: .valueChanged)

        view.addSubview(segmentedControl)
        segmentedControl.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }
        print("SegmentedControlViewController did load")
    }

    @objc func segmentChanged(_ sender: UISegmentedControl) {
        print("选择了: \(sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "")")
    }
}