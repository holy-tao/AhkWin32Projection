#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Forces the encoder to code the next frame as a key frame.
 * @remarks
 * This property is also used with [H.264 UVC 1.5 camera encoders](camera-encoder-h264-uvc-1-5.md).
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideoforcekeyframe
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncVideoForceKeyFrame {
    #StructPack 1

}
