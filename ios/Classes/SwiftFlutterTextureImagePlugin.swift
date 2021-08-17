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
    FLTTextureImageApiSetup(registrar.messenger(), FLTTextureImageApi())
    registrar.addMethodCallDelegate(instance, channel: channel)
  }
    

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    let arguments = (call.arguments as? Dictionary<String, Any?>)
    switch call.method {
      case "render":
        let width = arguments["width"] as Double
        let height = arguments["height"] as Double
        render(width, height)
      case "dispose":
        dispose()
      default:
        result(nil)
        return
    }
  }
  
  // ImageUrl から Texture を生成する
  private func render(_ widht: Double, _ height: Double) {
    
  }
  
  // Texture を破棄する
  private func dispose() {
    
  }
}
