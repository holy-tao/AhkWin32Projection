#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains the data that is associated with a transaction notification.
 * @see https://learn.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct TRANSACTION_NOTIFICATION {
    #StructPack 8

    /**
     * The user-defined, opaque ID for this transaction.
     */
    TransactionKey : IntPtr

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/Ktm/notification-mask">NOTIFICATION_MASK</a> value for this 
     *       transaction.
     */
    TransactionNotification : UInt32

    /**
     * The latest virtual clock value that is associated with this transaction. See 
     *       <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a>.
     */
    TmVirtualClock : Int64

    /**
     * Indicates the number of bytes for the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification_recovery_argument">TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT</a> 
     *       structure that follow this 
     *       <b>TRANSACTION_NOTIFICATION</b> structure.
     */
    ArgumentLength : UInt32

}
