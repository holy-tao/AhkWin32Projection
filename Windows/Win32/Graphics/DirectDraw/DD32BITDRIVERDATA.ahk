#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
class DD32BITDRIVERDATA extends Win32Struct {
    static sizeof => 328

    static packingSize => 4

    /**
     * @type {String}
     */
    szName {
        get => StrGet(this.ptr + 0, 259, "UTF-8")
        set => StrPut(value, this.ptr + 0, 259, "UTF-8")
    }

    /**
     * @type {String}
     */
    szEntryPoint {
        get => StrGet(this.ptr + 260, 63, "UTF-8")
        set => StrPut(value, this.ptr + 260, 63, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    dwContext {
        get => NumGet(this, 324, "uint")
        set => NumPut("uint", value, this, 324)
    }
}
