#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets the video select layer for a video encoder.
 * @remarks
 * This property is also used with [H.264 UVC 1.5 camera encoders](camera-encoder-h264-uvc-1-5.md).
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideoselectlayer
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoSelectLayer extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
