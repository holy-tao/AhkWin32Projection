#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual hard disk (VHD) expand request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-expand_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 */
class EXPAND_VIRTUAL_DISK_FLAG extends Win32BitflagEnum {

    /**
     * Native name: EXPAND_VIRTUAL_DISK_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: EXPAND_VIRTUAL_DISK_FLAG_NOTIFY_CHANGE
     * @type {Integer (Int32)}
     */
    static NOTIFY_CHANGE => 1
}
