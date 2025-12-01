#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the quantization parameter (QP) for video encoding.
 * @remarks
 * This property is also used with [H.264 UVC 1.5 camera encoders](camera-encoder-h264-uvc-1-5.md).
 * 
 * To insure consistent usage across different encoders, you should assume encoders will only look at the default QP and can ignore QP values for I/P/B pictures.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideoencodeqp
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoEncodeQP extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
