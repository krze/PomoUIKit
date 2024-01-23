import UIKit

final class PomoTopView: UIView {
    
    let timerCollectionView: UICollectionView
    
    init() {
        let timerFlowLayout = UICollectionViewFlowLayout()
        timerFlowLayout.scrollDirection = .horizontal
        
        timerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: timerFlowLayout)
        
        super.init(frame: .zero)
        
        timerCollectionView.translatesAutoresizingMaskIntoConstraints = false
        timerCollectionView.register(NumberViewCell.self, forCellWithReuseIdentifier: NumberViewCell.identifier)
        timerCollectionView.backgroundColor = .tomato
        timerCollectionView.showsHorizontalScrollIndicator = false

        addSubview(timerCollectionView)
        
        NSLayoutConstraint.activate([
            timerCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            timerCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            timerCollectionView.heightAnchor.constraint(equalToConstant: 60),
            timerCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
