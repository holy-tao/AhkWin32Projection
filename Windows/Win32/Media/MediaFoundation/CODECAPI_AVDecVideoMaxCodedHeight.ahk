#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Sets the maximum picture height that a video decoder will accept as an input type.
 * @see https://learn.microsoft.com/windows/win32/medfound/codecapi-avdecvideomaxcodedheight
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class CODECAPI_AVDecVideoMaxCodedHeight extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
