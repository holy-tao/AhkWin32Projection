#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FIND_FIRST_EX_FLAGS extends Win32BitflagEnum {

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_FIRST_EX_CASE_SENSITIVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_FIRST_EX_LARGE_FETCH => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FIND_FIRST_EX_ON_DISK_ENTRIES_ONLY => 4
}
