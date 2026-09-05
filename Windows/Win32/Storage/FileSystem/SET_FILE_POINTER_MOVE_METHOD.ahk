#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class SET_FILE_POINTER_MOVE_METHOD extends Win32Enum {

    /**
     * Native name: FILE_BEGIN
     * @type {Integer (UInt32)}
     */
    static BEGIN => 0

    /**
     * Native name: FILE_CURRENT
     * @type {Integer (UInt32)}
     */
    static CURRENT => 1

    /**
     * Native name: FILE_END
     * @type {Integer (UInt32)}
     */
    static END => 2
}
