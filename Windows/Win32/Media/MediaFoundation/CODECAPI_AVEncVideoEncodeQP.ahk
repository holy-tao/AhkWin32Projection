#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the quantization parameter (QP) for video encoding.
 * @remarks
 * This property is also used with [H.264 UVC 1.5 camera encoders](camera-encoder-h264-uvc-1-5.md).
 * 
 * To insure consistent usage across different encoders, you should assume encoders will only look at the default QP and can ignore QP values for I/P/B pictures.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideoencodeqp
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct CODECAPI_AVEncVideoEncodeQP {
    #StructPack 1

}
