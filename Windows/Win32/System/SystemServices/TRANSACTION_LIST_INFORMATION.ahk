#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\TRANSACTION_LIST_ENTRY.ahk

/**
 * @namespace Windows.Win32.System.SystemServices
 * @version v4.0.30319
 */
class TRANSACTION_LIST_INFORMATION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Integer}
     */
    NumberOfTransactions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<TRANSACTION_LIST_ENTRY>}
     */
    TransactionInformation{
        get {
            if(!this.HasProp("__TransactionInformationProxyArray"))
                this.__TransactionInformationProxyArray := Win32FixedArray(this.ptr + 8, 1, TRANSACTION_LIST_ENTRY, "")
            return this.__TransactionInformationProxyArray
        }
    }
}
