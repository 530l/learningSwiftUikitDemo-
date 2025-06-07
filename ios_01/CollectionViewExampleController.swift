import UIKit
import SnapKit

class CollectionViewExampleController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    private var collectionView: UICollectionView!
    private let data = Array(1...20).map { "项目 \($0)" }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 10
        layout.minimumLineSpacing = 10
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.backgroundColor = .clear

        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(10)
        }
        print("CollectionViewExampleController did load")
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemTeal
        cell.layer.cornerRadius = 8
        
        // 为 cell 添加一个 label 显示文本
        let label: UILabel
        if let existingLabel = cell.contentView.subviews.first(where: { $0 is UILabel }) as? UILabel {
            label = existingLabel
        } else {
            label = UILabel()
            label.textAlignment = .center
            label.textColor = .white
            cell.contentView.addSubview(label)
            label.snp.makeConstraints { make in make.edges.equalToSuperview() }
        }
        label.text = data[indexPath.item]
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 20) / 3 // 每行3个，减去间距
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("点击了: \(data[indexPath.item])")
    }
}