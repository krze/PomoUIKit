import UIKit

final class NumberView: UIView {
    
    init(number: Int) {
        super.init(frame: .zero)
        backgroundColor = .tomato
        createSubviews(with: number)
    }
    
    private func createSubviews(with number: Int) {
        let notch = UIView()
        notch.translatesAutoresizingMaskIntoConstraints = false
        notch.backgroundColor = .white
        
        addSubview(notch)
        
        NSLayoutConstraint.activate([
            notch.centerXAnchor.constraint(equalTo: centerXAnchor),
            notch.topAnchor.constraint(equalTo: centerYAnchor),
            notch.bottomAnchor.constraint(equalTo: bottomAnchor),
            notch.widthAnchor.constraint(equalToConstant: 4),
        ])
        
        let numberLabel = UILabel()
        numberLabel.translatesAutoresizingMaskIntoConstraints = false
        numberLabel.textAlignment = .center
        numberLabel.font = UIFont(name: "AmericanTypewriter-Bold", size: 24)
        numberLabel.textColor = .white
        numberLabel.text = "\(number)"
        
        addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            numberLabel.bottomAnchor.constraint(equalTo: notch.topAnchor, constant: -12),
            numberLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
