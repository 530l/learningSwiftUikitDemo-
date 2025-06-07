import UIKit
import SnapKit

class ProgressViewController: UIViewController {
    let progressView = UIProgressView(progressViewStyle: .default)
    var timer: Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        progressView.progress = 0.0 // 初始进度
        view.addSubview(progressView)
        progressView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().offset(-20)
        }

        // 模拟进度更新
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateProgress), userInfo: nil, repeats: true)
        print("ProgressViewController did load")
    }

    @objc func updateProgress() {
        progressView.progress += 0.1
        if progressView.progress >= 1.0 {
            timer?.invalidate()
            timer = nil
            progressView.progress = 1.0
            print("进度完成")
        }
    }

    deinit {
        timer?.invalidate()
    }
}