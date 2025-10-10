#Requires AutoHotkey v2.0.0 64-bit

/**
 * Contains the version of the virtual disk EXPAND_VIRTUAL_DISK_PARAMETERS structure to use in calls to virtual disk functions.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-expand_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class EXPAND_VIRTUAL_DISK_VERSION{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EXPAND_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static EXPAND_VIRTUAL_DISK_VERSION_1 => 1
}
