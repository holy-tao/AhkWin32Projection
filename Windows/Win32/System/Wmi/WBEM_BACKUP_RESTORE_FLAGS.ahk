#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains flags used for the IWbemBackupRestore::Restore method and the IWbemBackupRestoreEx::Restore method.
 * @see https://docs.microsoft.com/windows/win32/api//wbemcli/ne-wbemcli-wbem_backup_restore_flags
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WBEM_BACKUP_RESTORE_FLAGS extends Win32Enum{

    /**
     * Does not shut down active clients; returns an error if there are any.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_BACKUP_RESTORE_DEFAULT => 0

    /**
     * Shuts down any active clients.
     * @type {Integer (Int32)}
     */
    static WBEM_FLAG_BACKUP_RESTORE_FORCE_SHUTDOWN => 1
}
