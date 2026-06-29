#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains information about a transaction.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-txfs_list_transactions_entry
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct TXFS_LIST_TRANSACTIONS_ENTRY {
    #StructPack 8

    /**
     * The GUID of the transaction.
     */
    TransactionId : Guid

    /**
     * The current state of the transaction.
     */
    TransactionState : UInt32

    /**
     * Reserved.
     */
    Reserved1 : UInt32

    /**
     * Reserved.
     */
    Reserved2 : UInt32

    /**
     * Reserved.
     */
    Reserved3 : Int64

}
