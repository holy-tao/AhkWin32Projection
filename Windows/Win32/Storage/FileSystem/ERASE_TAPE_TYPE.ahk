#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class ERASE_TAPE_TYPE extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_ERASE_LONG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_ERASE_SHORT => 0
}
