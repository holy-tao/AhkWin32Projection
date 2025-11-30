#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class SET_FILE_POINTER_MOVE_METHOD extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_BEGIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_CURRENT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_END => 2
}
