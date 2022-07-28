import Foundation
import UIKit
class AppCoordinator: BaseCoordinator{
    weak var navigationController: UINavigationController?
    
    init(navigationController: UINavigationController) {
        super.init()
        self.navigationController = navigationController
    }
    
    override func start() {
        super.start()
        navigateToReactViewController() }
}

protocol ReactViewToAppCoordinatorDelegate: AnyObject {
    func navigateToFlutterViewController()
}

protocol FlutterToAppCoordinatorDelegate: AnyObject {
    func navigateToReactViewController()
}

extension AppCoordinator: ReactViewToAppCoordinatorDelegate{
    func navigateToFlutterViewController(){
        let coordinator = FlutterCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        self.add(coordinator)
        coordinator.start()
    }
}

extension AppCoordinator: FlutterToAppCoordinatorDelegate{
    func navigateToReactViewController(){
        let coordinator = ReactViewCoordinator(navigationController: self.navigationController)
        coordinator.delegate = self
        self.add(coordinator)
        coordinator.start()
    }
}
