import UIKit
import SnapKit

class ScrollViewExampleController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }

        let contentView = UIView()
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.width.equalToSuperview() // 关键：使 contentView 宽度与 scrollView 相同
        }

        var lastView: UIView? = nil
        for i in 0..<10 {
            let itemView = UIView()
            itemView.backgroundColor = (i % 2 == 0) ? .systemGreen : .systemYellow
            contentView.addSubview(itemView)

            itemView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(20)
                make.height.equalTo(100)
                if let last = lastView {
                    make.top.equalTo(last.snp.bottom).offset(10)
                } else {
                    make.top.equalToSuperview().offset(10)
                }
            }
            lastView = itemView
        }

        // 关键：设置 contentView 的底部约束，使其内容能撑开 scrollView
        if let last = lastView {
            contentView.snp.makeConstraints { make in
                make.bottom.equalTo(last.snp.bottom).offset(10)
            }
        }
        print("ScrollViewExampleController did load")
    }
}