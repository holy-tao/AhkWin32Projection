#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies under what conditions previous versions of files and folders can be deleted from a backup target.
 * @remarks
 * 
 * The operating system deletes previous versions from a backup target only when the target is full or when the user has initiated data retention manually by using the File History item in Control Panel.
 * 
 * If <b>FH_RETENTION_AGE_BASED</b> is specified and the target is large enough, it is possible for the target to contain versions that are much older than the minimum age that is specified by the <b>FH_RETENTION_AGE</b> local policy.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/ne-fhcfg-fh_retention_types
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FH_RETENTION_TYPES{

    /**
     * Previous versions are never deleted from the backup target.
     * @type {Integer (Int32)}
     */
    static FH_RETENTION_DISABLED => 0

    /**
     * The operating system can delete any previous version on an as-needed basis, unless it is the most recent version of a file that currently exists and is within the protection scope.
     * @type {Integer (Int32)}
     */
    static FH_RETENTION_UNLIMITED => 1

    /**
     * The operating system can delete any previous version older than the specified minimum age on as-needed basis, unless it is the most recent version of a file that  currently exists and is within the protection scope. The minimum age is specified by the <b>FH_RETENTION_AGE</b> local policy.
     * @type {Integer (Int32)}
     */
    static FH_RETENTION_AGE_BASED => 2

    /**
     * The maximum enumeration value for this enumeration. This value and all values greater than it are reserved for system use.
     * @type {Integer (Int32)}
     */
    static MAX_RETENTION_TYPE => 3
}
