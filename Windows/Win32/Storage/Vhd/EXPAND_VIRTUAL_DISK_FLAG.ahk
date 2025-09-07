#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains virtual hard disk (VHD) expand request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-expand_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class EXPAND_VIRTUAL_DISK_FLAG{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EXPAND_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static EXPAND_VIRTUAL_DISK_FLAG_NOTIFY_CHANGE => 1
}
