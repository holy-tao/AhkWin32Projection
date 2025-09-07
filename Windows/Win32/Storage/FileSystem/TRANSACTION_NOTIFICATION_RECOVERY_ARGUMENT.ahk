#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Indicates the transaction to be recovered. This structure is sent with a recovery notification.
 * @see https://learn.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification_recovery_argument
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * The enlistment identifier.
     * @type {Pointer<Guid>}
     */
    EnlistmentId {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * The transaction identifier, sometimes called the unit of work.
     * @type {Pointer<Guid>}
     */
    UOW {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
