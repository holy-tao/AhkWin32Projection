#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual disk compact request flags.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-compact_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class COMPACT_VIRTUAL_DISK_FLAG extends Win32BitflagEnum{

    /**
     * No flags are specified.
     * @type {Integer (Int32)}
     */
    static COMPACT_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COMPACT_VIRTUAL_DISK_FLAG_NO_ZERO_SCAN => 1

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COMPACT_VIRTUAL_DISK_FLAG_NO_BLOCK_MOVES => 2
}
