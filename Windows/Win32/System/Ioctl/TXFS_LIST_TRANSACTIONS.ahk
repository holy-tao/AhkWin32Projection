#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains a list of transactions.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transactions
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_LIST_TRANSACTIONS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The number of transactions for this resource manager.
     * @type {Integer}
     */
    NumberOfTransactions {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The length of the buffer required to hold the complete list of transactions at the time of this call. The number of transactions returned from one call to the next can change depending on the number of active transactions at any given point in time. If this call returns a request for a larger buffer, that size may or may not be adequate for the next call, based on the number of active transactions at the time of the next call.
     * @type {Integer}
     */
    BufferSizeRequired {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
