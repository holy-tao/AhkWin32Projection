#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains virtual disk detach request flags.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-detach_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class DETACH_VIRTUAL_DISK_FLAG{

    /**
     * No flags. Use system defaults.
     * @type {Integer (Int32)}
     */
    static DETACH_VIRTUAL_DISK_FLAG_NONE => 0
}
