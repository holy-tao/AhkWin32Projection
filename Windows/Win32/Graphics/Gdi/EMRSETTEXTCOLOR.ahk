#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk

/**
 * @namespace Windows.Win32.Graphics.Gdi
 * @version v4.0.30319
 */
class EMRSETTEXTCOLOR extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {EMR}
     */
    emr{
        get {
            if(!this.HasProp("__emr"))
                this.__emr := EMR(0, this)
            return this.__emr
        }
    }

    /**
     * @type {COLORREF}
     */
    crColor {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
