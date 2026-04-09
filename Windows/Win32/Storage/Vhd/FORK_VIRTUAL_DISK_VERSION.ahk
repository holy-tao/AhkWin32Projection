#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Vhd
 */
class FORK_VIRTUAL_DISK_VERSION extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static FORK_VIRTUAL_DISK_VERSION_UNSPECIFIED => 0

    /**
     * @type {Integer (Int32)}
     */
    static FORK_VIRTUAL_DISK_VERSION_1 => 1
}
