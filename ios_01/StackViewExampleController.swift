import UIKit
import SnapKit

class StackViewExampleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let stackView = UIStackView()
        stackView.axis = .vertical // 或者 .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10

        let view1 = UIView()
        view1.backgroundColor = .systemRed
        let label1 = UILabel(); label1.text = "View 1"; label1.textAlignment = .center; view1.addSubview(label1)
        label1.snp.makeConstraints { make in make.center.equalToSuperview() }

        let view2 = UIView()
        view2.backgroundColor = .systemBlue
        let label2 = UILabel(); label2.text = "View 2"; label2.textAlignment = .center; view2.addSubview(label2)
        label2.snp.makeConstraints { make in make.center.equalToSuperview() }

        let view3 = UIView()
        view3.backgroundColor = .systemGreen
        let label3 = UILabel(); label3.text = "View 3"; label3.textAlignment = .center; view3.addSubview(label3)
        label3.snp.makeConstraints { make in make.center.equalToSuperview() }

        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)

        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
            make.height.equalTo(300) // 给定一个高度示例
        }
        print("StackViewExampleController did load")
    }
}