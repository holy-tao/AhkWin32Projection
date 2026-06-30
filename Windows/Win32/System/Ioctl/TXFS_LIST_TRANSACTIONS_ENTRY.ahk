#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a transaction.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transactions_entry
 * @namespace Windows.Win32.System.Ioctl
 */
class TXFS_LIST_TRANSACTIONS_ENTRY extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * The GUID of the transaction.
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
     * The current state of the transaction.
     * @type {Integer}
     */
    TransactionState {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 32, "int64")
        set => NumPut("int64", value, this, 32)
    }
}
