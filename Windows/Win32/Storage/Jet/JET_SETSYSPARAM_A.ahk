#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset ANSI
 */
class JET_SETSYSPARAM_A extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    paramid {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {PSTR}
     */
    sz{
        get {
            if(!this.HasProp("__sz"))
                this.__sz := PSTR(this.ptr + 16)
            return this.__sz
        }
    }

    /**
     * @type {Integer}
     */
    err {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
