#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The type of backup created.
 * @see https://docs.microsoft.com/windows/win32/api//gpmgmt/ne-gpmgmt-gpmbackuptype
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMBackupType extends Win32Enum{

    /**
     * Backup of a Group Policy object.
     * @type {Integer (Int32)}
     */
    static typeGPO => 0

    /**
     * Backup of a Starter Group Policy object.
     * @type {Integer (Int32)}
     */
    static typeStarterGPO => 1
}
