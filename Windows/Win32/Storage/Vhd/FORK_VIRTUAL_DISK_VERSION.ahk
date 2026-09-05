#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.Vhd
 */
class FORK_VIRTUAL_DISK_VERSION extends Win32Enum {

    /**
     * Native name: FORK_VIRTUAL_DISK_VERSION_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static UNSPECIFIED => 0

    /**
     * Native name: FORK_VIRTUAL_DISK_VERSION_1
     * @type {Integer (Int32)}
     */
    static 1 => 1
}
