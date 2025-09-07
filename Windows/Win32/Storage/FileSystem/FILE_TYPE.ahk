#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class FILE_TYPE{

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_UNKNOWN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_DISK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_CHAR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_PIPE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FILE_TYPE_REMOTE => 32768
}
