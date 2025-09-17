#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains information about the lock status of a service control manager database. It is used by the QueryServiceLockStatus function. (ANSI)
 * @remarks
 * > [!NOTE]
  * > The winsvc.h header defines QUERY_SERVICE_LOCK_STATUS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-query_service_lock_statusa
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset ANSI
 */
class QUERY_SERVICE_LOCK_STATUSA extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The lock status of the database. If this member is nonzero, the database is locked. If it is zero, the database is unlocked.
     * @type {Integer}
     */
    fIsLocked {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The name of the user who acquired the lock.
     * @type {Pointer<Byte>}
     */
    lpLockOwner {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The time since the lock was first acquired, in seconds.
     * @type {Integer}
     */
    dwLockDuration {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
