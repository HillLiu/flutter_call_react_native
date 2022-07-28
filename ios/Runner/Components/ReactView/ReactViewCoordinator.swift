//
//  ReactViewCoordinator.swift
//  Runner
//
//

import Foundation
import UIKit

final class ReactViewCoordinator: BaseCoordinator{
    weak var navigationController: UINavigationController?
    weak var delegate: ReactViewToAppCoordinatorDelegate?
    
    override func start() {
        super.start()
        let storyboard = UIStoryboard(name: "ReactView", bundle: nil)
        if let container =  storyboard.instantiateViewController(withIdentifier: "ReactViewController") as? ReactViewController {
            container.coordinatorDelegate = self
            navigationController?.isNavigationBarHidden = false 
            navigationController?.pushViewController(container, animated: true)
        }
    }
    init(navigationController: UINavigationController?) {
        super.init()
        self.navigationController = navigationController
    }
}

protocol ReactViewCoordinatorDelegate {
    func navigateToFlutter()
}

extension ReactViewCoordinator: ReactViewCoordinatorDelegate{
    func navigateToFlutter(){
        self.delegate?.navigateToFlutterViewController()
    }
}
