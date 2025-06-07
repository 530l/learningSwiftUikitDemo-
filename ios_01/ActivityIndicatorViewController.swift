import UIKit
import SnapKit

class ActivityIndicatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let activityIndicator = UIActivityIndicatorView(style: .large) // 或者 .medium
        activityIndicator.color = .systemBlue
        activityIndicator.startAnimating()

        view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        print("ActivityIndicatorViewController did load")
    }
}