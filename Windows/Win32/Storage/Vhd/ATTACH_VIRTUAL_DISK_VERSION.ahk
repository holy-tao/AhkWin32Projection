#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains the version of the virtual hard disk (VHD) ATTACH_VIRTUAL_DISK_PARAMETERS structure to use in calls to VHD functions.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-attach_virtual_disk_version
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class ATTACH_VIRTUAL_DISK_VERSION extends Win32Enum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * 
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_VERSION_1 => 1

    /**
     * @type {Integer (Int32)}
     */
    static ATTACH_VIRTUAL_DISK_VERSION_2 => 2
}
