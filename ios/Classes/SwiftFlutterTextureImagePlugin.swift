import Flutter
import UIKit


public class SwiftFlutterTextureImagePlugin: NSObject, FlutterPlugin {
  let textureRegistry: FlutterTextureRegistry;
  private var pixelBuffer: CVPixelBuffer?
  var texureId: Int64?
  
  init(textureRegistry: FlutterTextureRegistry) {
    
  }

  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_texture_image", binaryMessenger: registrar.messenger())
    let instance = SwiftFlutterTextureImagePlugin()
    FLTTextureImageApiSetup(registrar.messenger(), TextureImageApi())
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = (call.arguments as? Dictionary<String, Any?>)
    switch call.method {
      case "render":
        let args = FLTNetworkImageMessage()
        let width = arguments["width"] as! Double
        let height = arguments["height"] as! Double
        let result = TextureImageApi.render()
        result(result)
        return
      case "dispose":
        TextureImageApi.dispose()
        result(nil)
        return
      default:
        result(nil)
        return
    }
  }

}
