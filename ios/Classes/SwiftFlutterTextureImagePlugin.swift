import Flutter
import UIKit


public class SwiftFlutterTextureImagePlugin: NSObject, FlutterPlugin {

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_texture_image", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterTextureImagePlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = (call.arguments as? Dictionary<String, Any?>)
    switch call.method {
      case "channelId":
        let id = arguments["id"]
        let _imageChannel = FlutterMethodChannel(name: "flutter_texture_image_\(id)")
        result("iOS " + id)
      case "createTextureImage":
        createTextureImage()
      case "dispose":
        dispose()
      default:
        result(nil)
        return
    }
  }
  
  // ImageUrl から Texture を生成する
  private func createTextureImage() {
    
  }
  
  // Texture を破棄する
  private func dispose() {
    
  }
}
