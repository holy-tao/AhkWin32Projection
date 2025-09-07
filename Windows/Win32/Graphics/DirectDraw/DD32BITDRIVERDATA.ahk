#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DD32BITDRIVERDATA extends Win32Struct
{
    static sizeof => 652

    static packingSize => 4

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    szEntryPoint {
        get => StrGet(this.ptr + 520, 63, "UTF-16")
        set => StrPut(value, this.ptr + 520, 63, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwContext {
        get => NumGet(this, 648, "uint")
        set => NumPut("uint", value, this, 648)
    }
}
