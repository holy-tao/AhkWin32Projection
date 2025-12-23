#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets whether the content is full-screen video, as opposed to screen content that might have a smaller window of video or have no video at all.
 * @remarks
 * On Windows 10, the value of this property is not used.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-videoencoderdisplaycontenttype
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_VideoEncoderDisplayContentType extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
