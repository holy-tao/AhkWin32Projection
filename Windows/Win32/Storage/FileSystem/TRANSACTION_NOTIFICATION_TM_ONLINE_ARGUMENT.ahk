#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TRANSACTION_NOTIFICATION_TM_ONLINE_ARGUMENT extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    TmIdentity {
        get {
            if(!this.HasProp("__TmIdentity"))
                this.__TmIdentity := Guid(0, this)
            return this.__TmIdentity
        }
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
