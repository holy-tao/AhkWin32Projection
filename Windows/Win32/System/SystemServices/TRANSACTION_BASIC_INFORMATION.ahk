#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_BASIC_INFORMATION extends Win32Struct {
    static sizeof => 24

    static packingSize => 4

    /**
     * @type {Guid}
     */
    TransactionId {
        get {
            if(!this.HasProp("__TransactionId"))
                this.__TransactionId := Guid(0, this)
            return this.__TransactionId
        }
    }

    /**
     * @type {Integer}
     */
    State {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Outcome {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
