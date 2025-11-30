#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILESYSTEM_STATISTICS_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_EXFAT => 3

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_FAT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static FILESYSTEM_STATISTICS_TYPE_NTFS => 1
}
