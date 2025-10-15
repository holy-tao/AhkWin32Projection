#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PSTR.ahk

/**
 * @namespace Windows.Win32.Devices.AllJoyn
 * @version v4.0.30319
 */
class alljoyn_interfacedescription_property extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PSTR}
     */
    name{
        get {
            if(!this.HasProp("__name"))
                this.__name := PSTR(this.ptr + 0)
            return this.__name
        }
    }

    /**
     * @type {PSTR}
     */
    signature{
        get {
            if(!this.HasProp("__signature"))
                this.__signature := PSTR(this.ptr + 8)
            return this.__signature
        }
    }

    /**
     * @type {Integer}
     */
    access {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Pointer<Void>}
     */
    internal_property {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }
}
