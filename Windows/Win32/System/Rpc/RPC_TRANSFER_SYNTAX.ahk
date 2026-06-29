#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.Rpc
 */
class RPC_TRANSFER_SYNTAX extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Guid}
     */
    Uuid {
        get {
            if(!this.HasProp("__Uuid"))
                this.__Uuid := Guid(0, this)
            return this.__Uuid
        }
    }

    /**
     * @type {Integer}
     */
    VersMajor {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    VersMinor {
        get => NumGet(this, 18, "ushort")
        set => NumPut("ushort", value, this, 18)
    }
}
