#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_CREATION_DISPOSITION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_NEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CREATE_ALWAYS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_EXISTING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OPEN_ALWAYS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static TRUNCATE_EXISTING => 5
}
