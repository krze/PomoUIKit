import UIKit

final class NumberViewCell: UICollectionViewCell {
    static let identifier = "NumberViewCell"
    private var numberView: NumberView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        let numberView = NumberView(number: 0)
        numberView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(numberView)
        NSLayoutConstraint.activate([
            numberView.topAnchor.constraint(equalTo: contentView.topAnchor),
            numberView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            numberView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            numberView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        ])
        self.numberView = numberView
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(number: Int) {
        numberView?.updateNumber(number: number)
    }
}
