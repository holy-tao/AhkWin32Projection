#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class FILESYSTEM_STATISTICS_TYPE extends Win32Enum {

    /**
     * Native name: FILESYSTEM_STATISTICS_TYPE_EXFAT
     * @type {Integer (UInt16)}
     */
    static EXFAT => 3

    /**
     * Native name: FILESYSTEM_STATISTICS_TYPE_FAT
     * @type {Integer (UInt16)}
     */
    static FAT => 2

    /**
     * Native name: FILESYSTEM_STATISTICS_TYPE_NTFS
     * @type {Integer (UInt16)}
     */
    static NTFS => 1
}
