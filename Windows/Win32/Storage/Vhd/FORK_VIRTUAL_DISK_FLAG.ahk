#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Vhd
 */
class FORK_VIRTUAL_DISK_FLAG extends Win32BitflagEnum {

    /**
     * @type {Integer (Int32)}
     */
    static FORK_VIRTUAL_DISK_FLAG_NONE => 0

    /**
     * @type {Integer (Int32)}
     */
    static FORK_VIRTUAL_DISK_FLAG_EXISTING_FILE => 1
}
