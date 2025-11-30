#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the storage device or network share can be used as a File History backup target.
 * @see https://docs.microsoft.com/windows/win32/api//fhcfg/ne-fhcfg-fh_device_validation_result
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FH_DEVICE_VALIDATION_RESULT extends Win32Enum{

    /**
     * The storage device or network share cannot be used as a backup target, because it is not accessible.
     * @type {Integer (Int32)}
     */
    static FH_ACCESS_DENIED => 0

    /**
     * The storage device or network share cannot be used as a backup target, because the drive type is not supported.  For example, a CD or DVD cannot be used as a  File History backup target.
     * @type {Integer (Int32)}
     */
    static FH_INVALID_DRIVE_TYPE => 1

    /**
     * The storage device or network share cannot be used as a backup target, because it is read-only.
     * @type {Integer (Int32)}
     */
    static FH_READ_ONLY_PERMISSION => 2

    /**
     * The storage device or network share is already being used as a backup target.
     * @type {Integer (Int32)}
     */
    static FH_CURRENT_DEFAULT => 3

    /**
     * The storage device or network share was previously used to back up files from a computer or user that has the same name as the current computer or user. It can be used as a backup target, but if it is used, the operating system will delete the previous backup.
     * @type {Integer (Int32)}
     */
    static FH_NAMESPACE_EXISTS => 4

    /**
     * The storage device or network share cannot be used as a backup target, because it is in the File History protection scope.
     * @type {Integer (Int32)}
     */
    static FH_TARGET_PART_OF_LIBRARY => 5

    /**
     * The storage device or network share can be used as a backup target.
     * @type {Integer (Int32)}
     */
    static FH_VALID_TARGET => 6

    /**
     * The maximum enumeration value for this enumeration. This value and all values greater than it are reserved for system use.
     * @type {Integer (Int32)}
     */
    static MAX_VALIDATION_RESULT => 7
}
