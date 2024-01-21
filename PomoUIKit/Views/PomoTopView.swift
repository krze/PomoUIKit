import UIKit

final class PomoTopView: UIView {
    
    let timerCollectionView: UICollectionView
    
    init() {
        let timerFlowLayout = UICollectionViewFlowLayout()
        timerFlowLayout.scrollDirection = .horizontal
        timerFlowLayout.itemSize = CGSize(width: 60, height: 60)
        
        timerCollectionView = UICollectionView(frame: .zero, collectionViewLayout: timerFlowLayout)
        
        super.init(frame: .zero)

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
