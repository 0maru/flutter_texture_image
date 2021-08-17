package com.toricotokyo.flutter_texture_image

class TextureImageApi : Messages.TextureImageApi{
    override fun render(arg: Messages.NetworkImageMessage?): Messages.TextureMessage {
        val message = Messages.TextureMessage()
        message.textureId = 1
        return message
    }

    override fun dispose(arg: Messages.TextureMessage?) {
        TODO("Not yet implemented")
    }
}