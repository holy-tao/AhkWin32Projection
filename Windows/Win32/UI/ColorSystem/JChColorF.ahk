#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * TBD.
 * @see https://docs.microsoft.com/windows/win32/api//wcsplugin/ns-wcsplugin-jchcolorf
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class JChColorF extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * TBD
     * @type {Float}
     */
    J {
        get => NumGet(this, 0, "float")
        set => NumPut("float", value, this, 0)
    }

    /**
     * TBD
     * @type {Float}
     */
    C {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * TBD
     * @type {Float}
     */
    h {
        get => NumGet(this, 8, "float")
        set => NumPut("float", value, this, 8)
    }
}
