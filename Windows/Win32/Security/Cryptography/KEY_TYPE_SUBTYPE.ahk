#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography
 */
class KEY_TYPE_SUBTYPE extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwKeySpec {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    Type {
        get {
            if(!this.HasProp("__Type"))
                this.__Type := Guid(4, this)
            return this.__Type
        }
    }

    /**
     * @type {Guid}
     */
    Subtype {
        get {
            if(!this.HasProp("__Subtype"))
                this.__Subtype := Guid(20, this)
            return this.__Subtype
        }
    }
}
