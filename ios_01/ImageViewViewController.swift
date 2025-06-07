import UIKit
import SnapKit

class ImageViewViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let imageView = UIImageView()
        // 尝试加载一个系统图片，如果您的 Assets 中有图片，可以使用 UIImage(named: "yourImageName")
        if #available(iOS 13.0, *) {
            imageView.image = UIImage(systemName: "star.fill") 
        } else {
            // Fallback on earlier versions - 你可能需要添加一个占位图或处理
            let label = UILabel()
            label.text = "iOS 13+ required for system images"
            label.textAlignment = .center
            view.addSubview(label)
            label.snp.makeConstraints { make in make.center.equalToSuperview() }
        }
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemOrange // 对于系统图片，可以设置 tintColor

        view.addSubview(imageView)

        imageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        print("ImageViewViewController did load")
    }
}