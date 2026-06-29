#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * Contains the flag that indicates whether transactions were active or not when a snapshot was taken.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_transaction_active_info
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_TRANSACTION_ACTIVE_INFO {
    #StructPack 1

    /**
     * This member is <b>TRUE</b> if the mounted snapshot volume had active transactions when the snapshot was taken; and <b>FALSE</b> otherwise.
     */
    TransactionsActiveAtSnapshot : BOOLEAN

}
