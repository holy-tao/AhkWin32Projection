#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the type of video content for a video encoder.
 * @remarks
 * This property is a hint to the encoder to optimize its encoding settings.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideocontenttype
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class CODECAPI_AVEncVideoContentType extends Win32Struct {
    static sizeof => 0

    static packingSize => 1
}
