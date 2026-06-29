#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTIONMANAGER_BASIC_INFORMATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 8

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
    VirtualClock {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
