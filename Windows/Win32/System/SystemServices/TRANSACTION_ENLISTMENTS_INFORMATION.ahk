#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSACTION_ENLISTMENT_PAIR.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TRANSACTION_ENLISTMENTS_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfEnlistments {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<TRANSACTION_ENLISTMENT_PAIR>}
     */
    EnlistmentPair{
        get {
            if(!this.HasProp("__EnlistmentPairProxyArray"))
                this.__EnlistmentPairProxyArray := Win32FixedArray(this.ptr + 8, 1, TRANSACTION_ENLISTMENT_PAIR, "")
            return this.__EnlistmentPairProxyArray
        }
    }
}
