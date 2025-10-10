#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about a transaction.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-txfs_list_transactions_entry
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_LIST_TRANSACTIONS_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The GUID of the transaction.
     * @type {Pointer<Guid>}
     */
    TransactionId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The current state of the transaction.
     * @type {Integer}
     */
    TransactionState {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved1 {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved2 {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Reserved.
     * @type {Integer}
     */
    Reserved3 {
        get => NumGet(this, 24, "int64")
        set => NumPut("int64", value, this, 24)
    }
}
