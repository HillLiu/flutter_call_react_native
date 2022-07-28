//
//  ReactViewController.swift
//  Runner
//

import UIKit
import React

class ReactViewController: UIViewController {
    var coordinatorDelegate: ReactViewCoordinatorDelegate?
    override func viewDidLoad() {
      super.viewDidLoad()
      let mockData:NSDictionary = ["scores":
          [
              ["name":"Alex", "value":"42"],
              ["name":"Joel", "value":"10"]
          ]
      ]

      let jsCodeLocation = URL(string: "http://localhost:8081/index.bundle?platform=ios")
      let rootView = RCTRootView(
          bundleURL: jsCodeLocation!,
          moduleName: "MyReactNativeApp",
          initialProperties: mockData as [NSObject : AnyObject],
          launchOptions: nil
      )
      self.view = rootView
      // self.navigationItem.leftBarButtonItem = nil
      // self.navigationItem.hidesBackButton = true
      // self.present(self, animated: true, completion: nil)
    }

    @IBAction func goToFlutter(_ sender: Any){
        coordinatorDelegate?.navigateToFlutter()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}
