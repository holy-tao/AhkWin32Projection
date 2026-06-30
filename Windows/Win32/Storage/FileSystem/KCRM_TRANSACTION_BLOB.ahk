#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class KCRM_TRANSACTION_BLOB extends Win32Struct {
    static sizeof => 172

    static packingSize => 4

    /**
     * @type {Guid}
     */
    UOW {
        get {
            if(!this.HasProp("__UOW"))
                this.__UOW := Guid(0, this)
            return this.__UOW
        }
    }

    /**
     * @type {Guid}
     */
    TmIdentity {
        get {
            if(!this.HasProp("__TmIdentity"))
                this.__TmIdentity := Guid(16, this)
            return this.__TmIdentity
        }
    }

    /**
     * @type {Integer}
     */
    IsolationLevel {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    IsolationFlags {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 44, 63, "UTF-16")
        set => StrPut(value, this.ptr + 44, 63, "UTF-16")
    }
}
