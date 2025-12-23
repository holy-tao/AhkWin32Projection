#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the type of video content for a video encoder.
 * @remarks
 * This property is a hint to the encoder to optimize its encoding settings.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avencvideocontenttype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVEncVideoContentType extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
