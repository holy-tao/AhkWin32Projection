#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Vhd
 */
class FORK_VIRTUAL_DISK_FLAG extends Win32BitflagEnum {

    /**
     * Native name: FORK_VIRTUAL_DISK_FLAG_NONE
     * @type {Integer (Int32)}
     */
    static NONE => 0

    /**
     * Native name: FORK_VIRTUAL_DISK_FLAG_EXISTING_FILE
     * @type {Integer (Int32)}
     */
    static EXISTING_FILE => 1
}
