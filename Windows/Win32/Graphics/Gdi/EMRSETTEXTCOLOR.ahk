#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\EMR.ahk
#Include ..\..\Foundation\COLORREF.ahk

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
                this.__emr := EMR(this.ptr + 0)
            return this.__emr
        }
    }

    /**
     * @type {COLORREF}
     */
    crColor{
        get {
            if(!this.HasProp("__crColor"))
                this.__crColor := COLORREF(this.ptr + 8)
            return this.__crColor
        }
    }
}
