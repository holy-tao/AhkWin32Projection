#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FIND_FIRST_EX_FLAGS extends Win32BitflagEnum {

    /**
     * Native name: FIND_FIRST_EX_CASE_SENSITIVE
     * @type {Integer (UInt32)}
     */
    static CASE_SENSITIVE => 1

    /**
     * Native name: FIND_FIRST_EX_LARGE_FETCH
     * @type {Integer (UInt32)}
     */
    static LARGE_FETCH => 2

    /**
     * Native name: FIND_FIRST_EX_ON_DISK_ENTRIES_ONLY
     * @type {Integer (UInt32)}
     */
    static ON_DISK_ENTRIES_ONLY => 4
}
