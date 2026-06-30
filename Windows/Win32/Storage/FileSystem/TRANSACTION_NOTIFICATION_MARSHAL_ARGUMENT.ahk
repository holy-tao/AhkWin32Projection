#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TRANSACTION_NOTIFICATION_MARSHAL_ARGUMENT extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    MarshalCookie {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Guid}
     */
    UOW {
        get {
            if(!this.HasProp("__UOW"))
                this.__UOW := Guid(4, this)
            return this.__UOW
        }
    }
}
