import UIKit

final class PomoTopView: UIView {
    
    init() {
        super.init(frame: .zero)
        
        // debug static for now
        let numberView = NumberView(number: 0)
        numberView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(numberView)
        
        NSLayoutConstraint.activate([
            numberView.widthAnchor.constraint(equalToConstant: 60),
            numberView.heightAnchor.constraint(equalToConstant: 60),
            numberView.centerXAnchor.constraint(equalTo: centerXAnchor),
            numberView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
