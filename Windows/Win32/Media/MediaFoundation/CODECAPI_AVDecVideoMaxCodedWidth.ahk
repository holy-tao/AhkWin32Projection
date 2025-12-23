#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets the maximum picture width that a video decoder will accept as an input type.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avdecvideomaxcodedwidth
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVDecVideoMaxCodedWidth extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
