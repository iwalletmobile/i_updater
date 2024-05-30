import Flutter
import UIKit

public class IUpdaterPlugin: NSObject, FlutterPlugin {
    private enum Method {
      static let getAppVersion = "getAppVersion"
      static let appId = "appId"
      static let openStore = "openStore"
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "i_updater", binaryMessenger: registrar.messenger())
    let instance = IUpdaterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case Method.getAppVersion:
      result(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "")
    case Method.appId:
      result(Bundle.main.bundleIdentifier as? String ?? "")
    case Method.openStore:
            if let arguments = call.arguments as? [String: Any],
               let urlString = arguments["url"] as? String,
               let url = URL(string: urlString) {
               UIApplication.shared.open(url, options: [:], completionHandler: nil)
                result(nil)
            } else {
                result(FlutterError(code: "invalid_arguments", message: "URL argument is missing or invalid", details: nil))
            }  
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
