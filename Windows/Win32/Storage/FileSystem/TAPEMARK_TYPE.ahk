#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class TAPEMARK_TYPE extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_FILEMARKS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_LONG_FILEMARKS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SETMARKS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static TAPE_SHORT_FILEMARKS => 2
}
