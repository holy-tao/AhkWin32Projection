#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the flag that indicates whether transactions were active or not when a snapshot was taken.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_transaction_active_info
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class TXFS_TRANSACTION_ACTIVE_INFO extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * This member is <b>TRUE</b> if the mounted snapshot volume had active transactions when the snapshot was taken; and <b>FALSE</b> otherwise.
     * @type {BOOLEAN}
     */
    TransactionsActiveAtSnapshot {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
