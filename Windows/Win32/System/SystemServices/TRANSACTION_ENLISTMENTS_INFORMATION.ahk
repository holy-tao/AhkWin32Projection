#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\TRANSACTION_ENLISTMENT_PAIR.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 */
class TRANSACTION_ENLISTMENTS_INFORMATION extends Win32Struct {
    static sizeof => 36

    static packingSize => 4

    /**
     * @type {Integer}
     */
    NumberOfEnlistments {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {TRANSACTION_ENLISTMENT_PAIR}
     */
    EnlistmentPair {
        get {
            if(!this.HasProp("__EnlistmentPairProxyArray"))
                this.__EnlistmentPairProxyArray := Win32FixedArray(this.ptr + 4, 1, TRANSACTION_ENLISTMENT_PAIR, "")
            return this.__EnlistmentPairProxyArray
        }
    }
}
