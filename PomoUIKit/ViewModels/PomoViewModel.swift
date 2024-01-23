import Combine
import UIKit
import Foundation

protocol PomoViewModeling: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    var timerRange: ClosedRange<Int> { get }
    var parentViewController: UIViewController? { get set }
    var selectedNumber: Published<Int>.Publisher { get }
}

final class PomoViewModel: NSObject, PomoViewModeling {
    
    let timerRange: ClosedRange<Int>
    var selectedNumber: Published<Int>.Publisher { $_selectedNumber }
    weak var parentViewController: UIViewController?

    @Published private var _selectedNumber: Int
    
    init(timerUpperBound: Int) {
        timerRange = 0...timerUpperBound
        _selectedNumber = 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        timerRange.upperBound
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: NumberViewCell.identifier, for: indexPath) as? NumberViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setup(number: indexPath.row)

        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return NumberViewCell.size
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0.0
    }
    
    func collectionView(
        _ collectionView:
        UICollectionView, 
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        return 0.0
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView,
              let parentView = parentViewController?.view else {
            return
        }
        
        let center = parentView.convert(collectionView.center, to: collectionView)
        
        guard
              let path = collectionView.indexPathForItem(at: center),
              let cell = collectionView.cellForItem(at: path) as? NumberViewCell
        else {
            return
        }
        
        _selectedNumber = cell.number
    }
    
}
