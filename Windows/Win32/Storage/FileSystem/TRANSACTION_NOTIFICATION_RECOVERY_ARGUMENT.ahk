#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Indicates the transaction to be recovered. This structure is sent with a recovery notification.
 * @see https://learn.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification_recovery_argument
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT {
    #StructPack 4

    /**
     * The enlistment identifier.
     */
    EnlistmentId : Guid

    /**
     * The transaction identifier, sometimes called the unit of work.
     */
    UOW : Guid

}
