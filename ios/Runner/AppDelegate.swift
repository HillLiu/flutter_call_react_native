import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {

  private var mainCoordinator: AppCoordinator?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
        let flutterViewController = window.rootViewController as! FlutterViewController

        let navigationController = UINavigationController(rootViewController: flutterViewController)
        navigationController.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        mainCoordinator = AppCoordinator(navigationController: navigationController)

        FlutterMethodChannel(name: "methodChannelDemo", binaryMessenger: flutterViewController.binaryMessenger).setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            

            guard let state = (call.arguments as? NSDictionary)?["state"] as? Int else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "Value of state cannot be null", details: nil))
                return
            }
            
            switch call.method {
            case "goToReact":
                self.mainCoordinator?.start()
                result(state)
            default:
                result(FlutterMethodNotImplemented)
            }
        })


    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
