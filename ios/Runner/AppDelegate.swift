import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        GeneratedPluginRegistrant.register(with: self)
        let router = PlatformRouterImp.init();
        FlutterBoostPlugin.sharedInstance().startFlutter(with: router, onStart: { (engine) in
        });
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
            let viewController = ViewController.init()
            let navi = UINavigationController.init(rootViewController: viewController)
            self.window.rootViewController = navi
            self.window.makeKeyAndVisible()
            
        return true;
        // return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
