import UIKit
import SnapKit

class AlertControllerExampleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let showAlertButton = UIButton(type: .system)
        showAlertButton.setTitle("显示 Alert", for: .normal)
        showAlertButton.addTarget(self, action: #selector(showAlert), for: .touchUpInside)

        let showActionSheetButton = UIButton(type: .system)
        showActionSheetButton.setTitle("显示 Action Sheet", for: .normal)
        showActionSheetButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)

        let stackView = UIStackView(arrangedSubviews: [showAlertButton, showActionSheetButton])
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.distribution = .fillEqually

        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(200)
        }
        print("AlertControllerExampleController did load")
    }

    @objc func showAlert() {
        let alert = UIAlertController(title: "提示", message: "这是一个 UIAlertController 示例。", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "确定", style: .default, handler: { _ in
            print("点击了确定")
        }))
        present(alert, animated: true, completion: nil)
    }

    @objc func showActionSheet() {
        let actionSheet = UIAlertController(title: "操作", message: "选择一个操作", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "操作一", style: .default, handler: { _ in
            print("选择了操作一")
        }))
        actionSheet.addAction(UIAlertAction(title: "操作二", style: .default, handler: { _ in
            print("选择了操作二")
        }))
        actionSheet.addAction(UIAlertAction(title: "删除", style: .destructive, handler: { _ in
            print("选择了删除")
        }))
        actionSheet.addAction(UIAlertAction(title: "取消", style: .cancel, handler: nil))
        
        // 对于 iPad，Action Sheet 需要一个源视图或 barButtonItem
        if let popoverController = actionSheet.popoverPresentationController {
            popoverController.sourceView = self.view
            popoverController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
            popoverController.permittedArrowDirections = []
        }
        
        present(actionSheet, animated: true, completion: nil)
    }
}