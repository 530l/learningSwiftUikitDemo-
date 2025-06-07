import UIKit
import SnapKit

class SliderViewController: UIViewController {
    let valueLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 50
        slider.addTarget(self, action: #selector(sliderChanged(_:)), for: .valueChanged)

        valueLabel.text = String(format: "%.0f", slider.value)
        valueLabel.textAlignment = .center

        view.addSubview(slider)
        view.addSubview(valueLabel)

        slider.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(30)
            make.trailing.equalToSuperview().offset(-30)
        }
        valueLabel.snp.makeConstraints { make in
            make.centerX.equalTo(slider)
            make.bottom.equalTo(slider.snp.top).offset(-20)
        }
        print("SliderViewController did load")
    }

    @objc func sliderChanged(_ sender: UISlider) {
        valueLabel.text = String(format: "%.0f", sender.value)
        print("滑块值: \(sender.value)")
    }
}