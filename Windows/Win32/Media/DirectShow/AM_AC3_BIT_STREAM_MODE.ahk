#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AM_AC3_BIT_STREAM_MODE extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * @type {Integer}
     */
    BitStreamMode {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }
}
