#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_ACTION extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_ADDED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_REMOVED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_MODIFIED => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_RENAMED_OLD_NAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_ACTION_RENAMED_NEW_NAME => 5
}
