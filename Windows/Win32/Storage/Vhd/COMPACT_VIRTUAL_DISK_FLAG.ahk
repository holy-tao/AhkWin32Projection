#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual disk compact request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-compact_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class COMPACT_VIRTUAL_DISK_FLAG extends Win32BitflagEnum {

    /**
     * No flags are specified.
     * Native name: COMPACT_VIRTUAL_DISK_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: COMPACT_VIRTUAL_DISK_FLAG_NO_ZERO_SCAN
     * @type {Integer (Int32)}
     */
    static NO_ZERO_SCAN => 1

    /**
     * Native name: COMPACT_VIRTUAL_DISK_FLAG_NO_BLOCK_MOVES
     * @type {Integer (Int32)}
     */
    static NO_BLOCK_MOVES => 2
}
