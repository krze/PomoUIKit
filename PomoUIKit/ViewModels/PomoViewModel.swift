import Combine
import UIKit
import Foundation

protocol PomoViewModeling: UICollectionViewDataSource {
    var timerRange: ClosedRange<Int> { get }
}

final class PomoViewModel: NSObject, PomoViewModeling {
    let timerRange: ClosedRange<Int>
    
    init(timerUpperBound: Int) {
        timerRange = 0...timerUpperBound
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
}
