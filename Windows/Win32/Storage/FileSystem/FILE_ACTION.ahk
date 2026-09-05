#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_ACTION extends Win32Enum {

    /**
     * Native name: FILE_ACTION_ADDED
     * @type {Integer (UInt32)}
     */
    static ADDED => 1

    /**
     * Native name: FILE_ACTION_REMOVED
     * @type {Integer (UInt32)}
     */
    static REMOVED => 2

    /**
     * Native name: FILE_ACTION_MODIFIED
     * @type {Integer (UInt32)}
     */
    static MODIFIED => 3

    /**
     * Native name: FILE_ACTION_RENAMED_OLD_NAME
     * @type {Integer (UInt32)}
     */
    static RENAMED_OLD_NAME => 4

    /**
     * Native name: FILE_ACTION_RENAMED_NEW_NAME
     * @type {Integer (UInt32)}
     */
    static RENAMED_NEW_NAME => 5
}
