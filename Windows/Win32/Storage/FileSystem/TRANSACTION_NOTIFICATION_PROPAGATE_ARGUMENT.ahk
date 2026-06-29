#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TRANSACTION_NOTIFICATION_PROPAGATE_ARGUMENT extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {Integer}
     */
    PropagationCookie {
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

    /**
     * @type {Guid}
     */
    TmIdentity {
        get {
            if(!this.HasProp("__TmIdentity"))
                this.__TmIdentity := Guid(20, this)
            return this.__TmIdentity
        }
    }

    /**
     * @type {Integer}
     */
    BufferLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }
}
