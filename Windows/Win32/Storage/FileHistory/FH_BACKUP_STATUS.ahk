#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether File History backups are enabled.
 * @remarks
 * 
 * The protection scope is the set of files and folders that  are backed up by the File History feature. The default protection scope includes all folders from all user libraries and the  Contacts, Desktop, and Favorites folders.
 * 
 * The <b>FH_STATUS_DISABLED_BY_GP</b> status can be queried by calling the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-getbackupstatus">IFhConfigMgr::GetBackupStatus</a> method, but it cannot be set by calling the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-setbackupstatus">IFhConfigMgr::SetBackupStatus</a> method. This is because it can only be set by Group Policy.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/ne-fhcfg-fh_backup_status
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FH_BACKUP_STATUS extends Win32Enum{

    /**
     * File History backups are not enabled by the user.
     * @type {Integer (Int32)}
     */
    static FH_STATUS_DISABLED => 0

    /**
     * File History backups are disabled by Group Policy.
     * @type {Integer (Int32)}
     */
    static FH_STATUS_DISABLED_BY_GP => 1

    /**
     * File History backups are enabled.
     * @type {Integer (Int32)}
     */
    static FH_STATUS_ENABLED => 2

    /**
     * 
     * @type {Integer (Int32)}
     */
    static FH_STATUS_REHYDRATING => 3

    /**
     * The maximum enumeration value for this enumeration. This value and all values greater than it are reserved for system use.
     * @type {Integer (Int32)}
     */
    static MAX_BACKUP_STATUS => 4
}
