#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.Ndis
 */
class NDIS_GUID extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * @type {Guid}
     */
    Guid {
        get {
            if(!this.HasProp("__Guid"))
                this.__Guid := Guid(0, this)
            return this.__Guid
        }
    }

    /**
     * @type {Integer}
     */
    Oid {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
