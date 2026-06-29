#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags used for the IWbemBackupRestore::Restore method and the IWbemBackupRestoreEx::Restore method.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/ne-wbemcli-wbem_backup_restore_flags
 * @namespace Windows.Win32.System.Wmi
 */
export default struct WBEM_BACKUP_RESTORE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
