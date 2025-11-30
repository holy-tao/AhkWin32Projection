#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains virtual hard disk (VHD) merge request flags.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ne-virtdisk-merge_virtual_disk_flag
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class MERGE_VIRTUAL_DISK_FLAG extends Win32BitflagEnum{

    /**
     * 
     * @type {Integer (Int32)}
     */
    static MERGE_VIRTUAL_DISK_FLAG_NONE => 0
}
