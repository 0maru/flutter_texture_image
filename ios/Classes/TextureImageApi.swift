//
//  TextureImageApi.swift
//  flutter_texture_image
//
//  Created by 0maru on 2021/08/17.
//

import Foundation

class TextureImageApi: FLTTextureImageApi {
    static public func render(_ msg: FLTNetworkImageMessage, _ error: FlutterError) -> FLTTextureMessage {
        let args = FLTNetworkImageMessage()
        let res = FLTTextureMessage()
        res.textureId = 1
        return res
    }
    
    static public func dispose(_ msg: FLTTextureMessage) -> Void {
        return
    }
}
