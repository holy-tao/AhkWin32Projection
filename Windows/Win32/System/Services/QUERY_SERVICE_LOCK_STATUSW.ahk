#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains information about the lock status of a service control manager database. It is used by the QueryServiceLockStatus function. (Unicode)
 * @remarks
 * > [!NOTE]
 * > The winsvc.h header defines QUERY_SERVICE_LOCK_STATUS as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-query_service_lock_statusw
 * @namespace Windows.Win32.System.Services
 * @charset Unicode
 */
export default struct QUERY_SERVICE_LOCK_STATUSW {
    #StructPack 8

    /**
     * The lock status of the database. If this member is nonzero, the database is locked. If it is zero, the database is unlocked.
     */
    fIsLocked : UInt32

    /**
     * The name of the user who acquired the lock.
     */
    lpLockOwner : PWSTR

    /**
     * The time since the lock was first acquired, in seconds.
     */
    dwLockDuration : UInt32

}
