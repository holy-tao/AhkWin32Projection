#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Storage.FileSystem
 */
class FILE_TYPE extends Win32Enum {

    /**
     * Native name: FILE_TYPE_UNKNOWN
     * @type {Integer (UInt32)}
     */
    static UNKNOWN => 0

    /**
     * Native name: FILE_TYPE_DISK
     * @type {Integer (UInt32)}
     */
    static DISK => 1

    /**
     * Native name: FILE_TYPE_CHAR
     * @type {Integer (UInt32)}
     */
    static CHAR => 2

    /**
     * Native name: FILE_TYPE_PIPE
     * @type {Integer (UInt32)}
     */
    static PIPE => 3

    /**
     * Native name: FILE_TYPE_REMOTE
     * @type {Integer (UInt32)}
     */
    static REMOTE => 32768
}
