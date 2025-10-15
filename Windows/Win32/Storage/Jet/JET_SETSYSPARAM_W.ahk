#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\StructuredStorage\JET_API_PTR.ahk

/**
 * @namespace Windows.Win32.Storage.Jet
 * @version v4.0.30319
 * @charset Unicode
 */
class JET_SETSYSPARAM_W extends Win32Struct
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
     * @type {JET_API_PTR}
     */
    lParam{
        get {
            if(!this.HasProp("__lParam"))
                this.__lParam := JET_API_PTR(this.ptr + 8)
            return this.__lParam
        }
    }

    /**
     * @type {Pointer<UInt16>}
     */
    sz {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    err {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
