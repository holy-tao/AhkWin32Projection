#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains the data that is associated with a transaction notification.
 * @see https://learn.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TRANSACTION_NOTIFICATION extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The user-defined, opaque ID for this transaction.
     * @type {Pointer<Void>}
     */
    TransactionKey {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The <a href="https://docs.microsoft.com/windows/desktop/Ktm/notification-mask">NOTIFICATION_MASK</a> value for this 
     *       transaction.
     * @type {Integer}
     */
    TransactionNotification {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The latest virtual clock value that is associated with this transaction. See 
     *       <a href="https://docs.microsoft.com/windows/win32/api/winnt/ns-winnt-large_integer-r1">LARGE_INTEGER</a>.
     * @type {Integer}
     */
    TmVirtualClock {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }

    /**
     * Indicates the number of bytes for the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification_recovery_argument">TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT</a> 
     *       structure that follow this 
     *       <b>TRANSACTION_NOTIFICATION</b> structure.
     * @type {Integer}
     */
    ArgumentLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
