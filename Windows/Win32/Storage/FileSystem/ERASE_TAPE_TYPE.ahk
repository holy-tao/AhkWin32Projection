#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class ERASE_TAPE_TYPE extends Win32Enum {

    /**
     * Native name: TAPE_ERASE_LONG
     * @type {Integer (UInt32)}
     */
    static ERASE_LONG => 1

    /**
     * Native name: TAPE_ERASE_SHORT
     * @type {Integer (UInt32)}
     */
    static ERASE_SHORT => 0
}
