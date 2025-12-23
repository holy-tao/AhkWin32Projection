#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_NOTIFY_CHANGE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_FILE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_DIR_NAME => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_ATTRIBUTES => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_SIZE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_LAST_WRITE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_LAST_ACCESS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_CREATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_NOTIFY_CHANGE_SECURITY => 256
}
