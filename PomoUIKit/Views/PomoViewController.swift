import Combine
import UIKit

final class PomoViewController: UIViewController {
    private let viewModel: PomoViewModeling
    private var cancellables: [AnyCancellable] = []
    init(viewModel: PomoViewModeling) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.parentViewController = self
        
        viewModel.selectedNumber.sink { selectedNumber in
            print(selectedNumber)
        }.store(in: &cancellables)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        cancellables.forEach { $0.cancel() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .tomato
        
        let topView = PomoTopView()
        topView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(topView)
        
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.topAnchor),
            topView.bottomAnchor.constraint(equalTo: view.centerYAnchor),
            topView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        topView.timerCollectionView.dataSource = viewModel
        topView.timerCollectionView.delegate = viewModel
        
        let bottomView = PomoBottomView()
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(bottomView)
        
        NSLayoutConstraint.activate([
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        let offset = (view.bounds.width / 2) - NumberViewCell.size.width / 2
        topView.timerCollectionView.contentInset = UIEdgeInsets(top: 0, left: offset, bottom: 0, right: offset)
        topView.timerCollectionView.contentOffset = CGPoint(x: -offset, y: .zero)
    }
    
}

