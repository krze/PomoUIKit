import UIKit

final class PomoBottomView: UIView {
    
    init() {
        super.init(frame: .zero)
        backgroundColor = .tomato
        createSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func createSubviews() {
        let notchContainer = UIView()
        addSubview(notchContainer)
        notchContainer.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            notchContainer.centerXAnchor.constraint(equalTo: centerXAnchor),
            notchContainer.topAnchor.constraint(equalTo: topAnchor),
            notchContainer.widthAnchor.constraint(equalToConstant: 60),
            notchContainer.heightAnchor.constraint(equalToConstant: 60)
        ])
        
        let notch = UIView()
        notch.translatesAutoresizingMaskIntoConstraints = false
        notch.backgroundColor = .white
        
        notchContainer.addSubview(notch)
        
        NSLayoutConstraint.activate([
            notch.centerXAnchor.constraint(equalTo: notchContainer.centerXAnchor),
            notch.topAnchor.constraint(equalTo: notchContainer.topAnchor, constant: 4),
            notch.bottomAnchor.constraint(equalTo: notchContainer.centerYAnchor),
            notch.widthAnchor.constraint(equalToConstant: 4),
        ])
    }
}
