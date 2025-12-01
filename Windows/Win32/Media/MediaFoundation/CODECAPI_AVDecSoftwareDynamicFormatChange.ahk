#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets whether to use software dynamic format change for internal resizing.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avdecsoftwaredynamicformatchange
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVDecSoftwareDynamicFormatChange extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
