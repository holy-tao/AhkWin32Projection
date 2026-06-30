#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Indicates the transaction to be recovered. This structure is sent with a recovery notification.
 * @see https://learn.microsoft.com/windows/win32/api/ktmtypes/ns-ktmtypes-transaction_notification_recovery_argument
 * @namespace Windows.Win32.Storage.FileSystem
 */
class TRANSACTION_NOTIFICATION_RECOVERY_ARGUMENT extends Win32Struct {
    static sizeof => 32

    static packingSize => 4

    /**
     * The enlistment identifier.
     * @type {Guid}
     */
    EnlistmentId {
        get {
            if(!this.HasProp("__EnlistmentId"))
                this.__EnlistmentId := Guid(0, this)
            return this.__EnlistmentId
        }
    }

    /**
     * The transaction identifier, sometimes called the unit of work.
     * @type {Guid}
     */
    UOW {
        get {
            if(!this.HasProp("__UOW"))
                this.__UOW := Guid(16, this)
            return this.__UOW
        }
    }
}
